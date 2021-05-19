//
//  ImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class DreamViewController: UIViewController {
   
    @IBOutlet var notFound: NotFound!
    @IBOutlet weak var dreamTableView: UITableView!
    @IBOutlet var headerView: Header!
    var userData: User = AuthUser.data
    var progressBarData: Float = 0.0
    var passIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: String(describing: DreamTableViewCell.self), bundle: nil)
        dreamTableView.register(nib, forCellReuseIdentifier: String(describing: DreamTableViewCell.self))
        dreamTableView.backgroundColor = AppColor.mainBG
        dreamTableView.delegate = self
        dreamTableView.dataSource = self
        notFound.delegate = self
        headerView.delegate = self
        
        //View Style
        setViewStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dreamTableView.reloadData()
        if dreams.count > 0 {
            self.dreamTableView.isHidden = false
            
            self.notFound.isHidden = true
            self.notFound.addButton.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        dreamTableView.reloadData()
    }
}

extension DreamViewController {
    fileprivate func setProgress(_ indexPath: IndexPath) -> Float {
        let currentDouble = Double.setDecimalToDouble(value: userData.balance)
        let targetDouble = Double.setDecimalToDouble(value: dreams[indexPath.row].targetAmount)
        progressBarData = Float(currentDouble / targetDouble)
        
        //Conditional Progress Bar Data
        if progressBarData > 1 {
            return 1
        } else {
            return progressBarData
        }
    }
    
    fileprivate func setViewStyle() {
        view.backgroundColor = AppColor.mainBG
        notFound.addButton.setTitle("Tambah Impian", for: .normal)
        headerView.headerLabel.text = "Impian"
    }
    
    func goAddDreamView() {
        let addImpianView = AddDreamViewController(nibName: String(describing: AddDreamViewController.self), bundle: nil)
        addImpianView.modalPresentationStyle = .fullScreen
        addImpianView.modalTransitionStyle = .coverVertical
        addImpianView.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addImpianView, animated: true)
    }
    
    func confirmAction(_ tag: Int) {
        //Save To Usage
        let id: String = String.randomCapitalizeWithNumber()
        let title: String = dreams[tag].title
        let price: Decimal = dreams[tag].targetAmount
        let status: UsageType = .moneyOut
        
        //Input To Array
        usages.append(Usage(id: id, title: title, price: price, date: Date(), status: status, UserId: userData.userId))
        
        //Delete From Dream
        dreams.remove(at: tag)
        
        //Subtract Balance
        userData.balance -= price
        
        //Navigate
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension DreamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //deselect row animation
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailDreamVC = DetailDreamViewController(nibName: String(describing: DetailDreamViewController.self), bundle: nil)
        
        detailDreamVC.modalPresentationStyle = .fullScreen
        detailDreamVC.modalTransitionStyle = .coverVertical
        
        //Passing Data
        detailDreamVC.passIndex = indexPath.row
        detailDreamVC.passProgressData = setProgress(indexPath)
        detailDreamVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailDreamVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dreams.count > 0 {
            return dreams.count
        } else {
            self.dreamTableView.isHidden = true
            self.notFound.isHidden = false
            self.notFound.addButton.isHidden = false
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = tableView.dequeueReusableCell(withIdentifier: String(describing: DreamTableViewCell.self), for: indexPath) as! DreamTableViewCell
        
        //change selected color
        dataCell.selectionStyle = .none
        
        dataCell.title.text = dreams[indexPath.row].title
        dataCell.targetAmount.text = String.setDecimalToStringCurrencyWithIDR(amountValue: dreams[indexPath.row].targetAmount)
        
        dataCell.balance.text = String.setDecimalToStringCurrencyWithIDR(amountValue: userData.balance)
        dataCell.progressBar.progress = setProgress(indexPath)
        
        dataCell.delegate = self
        dataCell.confirmButton.tag = indexPath.row
        passIndex = indexPath.row
        
        if setProgress(indexPath) < 1.0 {
            dataCell.confirmButton.setImage(UIImage(named: "Confirm_IC_Disable"), for: .normal)
            dataCell.confirmButton.isEnabled = false
            dataCell.confirmButton.isUserInteractionEnabled = false
        } else {
            dataCell.confirmButton.setImage(UIImage(named: "Confirm_IC"), for: .normal)
            dataCell.confirmButton.isEnabled = true
            dataCell.confirmButton.isUserInteractionEnabled = true
        }
        return dataCell
    }
}

extension DreamViewController: DreamTableDelegate {
    func confirmButton(_ tag: Int) {
        let alert = UIAlertController(title: "Konfirmasi Mimpi", message: "Apakah anda yakin ingin mengkonfirmasi mimpi \"\(dreams[tag].title)\" ?", preferredStyle: .alert)
        
        let deleteButton = UIAlertAction(title: "Konfirmasi", style: .default) { (_) -> Void in
            self.confirmAction(tag)
            self.dreamTableView.reloadData()
        }
        
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func deleteButton(_ tag: Int) {
        //Delete From Dream
        let alert = UIAlertController(title: "Menghapus Impian", message: "Apakah anda yakin ingin menghapus impian \"\(dreams[tag].title)\" ?", preferredStyle: .alert)
        
        let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
            dreams.remove(at: tag)
            self.dreamTableView.reloadData()
        }
        
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension DreamViewController: NotFoundDelegate, HeaderDelegate {
    func notFoundButtonAction() {
        goAddDreamView()
    }
    
    func headerButtonAction() {
        goAddDreamView()
    }
}
