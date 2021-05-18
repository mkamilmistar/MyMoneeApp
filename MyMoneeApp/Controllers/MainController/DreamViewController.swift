//
//  ImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class DreamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NotFoundDelegate, HeaderDelegate {
   
    @IBOutlet var notFound: NotFound!
    @IBOutlet weak var dreamTableView: UITableView!
    @IBOutlet var headerView: Header!
    var userData: User = AuthUser.data
    var progressBarData: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View Style 
        setViewStyle()
        
        let nib = UINib(nibName: String(describing: DreamTableViewCell.self), bundle: nil)
        
        dreamTableView.register(nib, forCellReuseIdentifier: String(describing: DreamTableViewCell.self))
        dreamTableView.backgroundColor = AppColor.mainBG
        dreamTableView.delegate = self
        dreamTableView.dataSource = self
        notFound.delegate = self
        headerView.delegate = self
        
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
        dataCell.targetAmount.text = setDecimalToStringCurrency(amountValue: dreams[indexPath.row].targetAmount)
        
        dataCell.balance.text = setDecimalToStringCurrency(amountValue: userData.balance)
        dataCell.progressBar.progress = setProgress(indexPath)
        
        return dataCell
    }
    
    //Navigation
    func notFoundButtonAction() {
        goAddDreamView()
    }
    
    func headerButtonAction() {
        goAddDreamView()
    }
   
    
}

extension DreamViewController {
    fileprivate func setProgress(_ indexPath: IndexPath) -> Float {
        let currentDouble = setDecimalToDouble(value: userData.balance)
        
        let targetDouble = setDecimalToDouble(value: dreams[indexPath.row].targetAmount)
        
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
    
}
