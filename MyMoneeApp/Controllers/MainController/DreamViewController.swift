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
    var transactionService = TransactionService()
    var dreamService = DreamService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: String(describing: DreamTableViewCell.self), bundle: nil)
        dreamTableView.register(nib, forCellReuseIdentifier: String(describing: DreamTableViewCell.self))
        dreamTableView.backgroundColor = UIColor.mainBG()
        dreamTableView.delegate = self
        dreamTableView.dataSource = self
        notFound.delegate = self
        headerView.delegate = self
        
        // View Style
        setViewStyle()
        self.createSpinnerView()
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        dreamTableView.reloadData()
        dataNotFound()
    }
    
    func loadData() {
        dreamService.getDreams { (dreamList) in
            DispatchQueue.main.async {
                dreamResponse = dreamList
                self.dataNotFound()
                self.dreamTableView.reloadData()
            }
        }
    }
}

extension DreamViewController {
    fileprivate func setProgress(_ indexPath: IndexPath) -> Float {
        let currentDouble = userData.balance.setDecimalToDouble
        let targetDouble = dreamResponse[indexPath.row].targetAmount.setDecimalToDouble
        progressBarData = Float(currentDouble / targetDouble)
        
        // Conditional Progress Bar Data
        if progressBarData > 1 {
            return 1
        } else {
            return progressBarData
        }
    }
    
    fileprivate func setViewStyle() {
        view.backgroundColor = UIColor.mainBG()
        notFound.addButton.setTitle("Tambah Impian", for: .normal)
        headerView.headerLabel.text = "Impian"
    }
    
    func goAddDreamView() {
        let addImpianView = AddDreamViewController(
            nibName: String(describing: AddDreamViewController.self),
            bundle: nil)
        addImpianView.modalPresentationStyle = .fullScreen
        addImpianView.modalTransitionStyle = .coverVertical
        addImpianView.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addImpianView, animated: true)
    }
    
    func confirmAction(_ index: Int) {
        // Save To Usage
        let transactionId: String = String.randomCapitalizeWithNumber()
        let title: String = dreamResponse[index].title
        let price: Decimal = dreamResponse[index].targetAmount
        let status: String = "debit"
        
        self.createSpinnerView()

        transactionService.addTransaction(uploadDataModel: TransactionResponse(
                                transactionId: transactionId, title: title, amount: price,
                                type: status, createdAt: Date(), updatedAt: Date())) {
            DispatchQueue.main.async {
                Helper.showToast("Impian Berhasil Dikonfirmasi")
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        // delete Dreams
        dreamService.deleteDream(dreamResponse[passIndex].dreamId) {
            print("Deleted")
        }

        // Subtract Balance
        userData.balance -= price
        
    }
    
    fileprivate func dataNotFound() {
        if dreamResponse.count > 0 {
            self.dreamTableView.isHidden = false
            self.notFound.isHidden = true
            self.notFound.addButton.isHidden = true
        }
    }
    
}

extension DreamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // deselect row animation
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailDreamVC = DetailDreamViewController(
            nibName: String(describing: DetailDreamViewController.self),
            bundle: nil)
        
        detailDreamVC.modalPresentationStyle = .fullScreen
        detailDreamVC.modalTransitionStyle = .coverVertical
        
        // Passing Data
        detailDreamVC.passIndex = indexPath.row
        detailDreamVC.passProgressData = setProgress(indexPath)
        detailDreamVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailDreamVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataNotFound()
        return dreamResponse.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: DreamTableViewCell.self),
            for: indexPath) as! DreamTableViewCell
        
        // change selected color
        dataCell.selectionStyle = .none
        
        dataCell.title.text = dreamResponse[indexPath.row].title
        
        dataCell.targetAmount.text = dreamResponse[indexPath.row].targetAmount.setDecimalToStringCurrencyWithIDR
            
        dataCell.balance.text = userData.balance.setDecimalToStringCurrencyWithIDR
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
        let alert = UIAlertController(
            title: "Konfirmasi Mimpi", message:
                "Apakah anda yakin ingin mengkonfirmasi mimpi \"\(dreamResponse[tag].title)\" ?",
            preferredStyle: .alert)
        
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
        // Delete From Dream
        let alert = UIAlertController(
            title: "Menghapus Impian", message:
                "Apakah anda yakin ingin menghapus impian \"\(dreamResponse[tag].title)\" ?",
            preferredStyle: .alert)
        
        let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
            self.dreamService.deleteDream(dreamResponse[self.passIndex].dreamId) {
                print("sukses")
                Helper.showToast("Impian Berhasil Dihapus")
            }
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
