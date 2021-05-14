//
//  EditImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditDreamViewController: UIViewController {

    var passIndex: Int? = nil
    var passTitle: String? = ""
    var passProgress: Float? = 0.0
    var passCurrentAmount: Decimal? = 0.0
    var passTargetAmount: Decimal? = 0.0
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var amountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCompProperties()
        
        //Set Value
        titleField.text = passTitle
        amountField.text = setDecimalToString(amountValue: passCurrentAmount ?? 0.0)
        
    }

    @IBAction func updateButton(_ sender: UIButton) {
        updateDream()
        goToDreamView()
    }
    
    @IBAction func deleteAction(_ sender: UITapGestureRecognizer) {
            let alert = UIAlertController(title: "Menghapus Impian", message: "Apakah anda yakin menghapus impian \"Membeli Airpods Baru\" ?", preferredStyle: .alert)
            
            let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
                self.deleteDream()
            }
            
            let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
            
            alert.addAction(cancelButton)
            alert.addAction(deleteButton)
            
            present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func backButton(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func deleteDream() {
        dreams.remove(at: passIndex!)
        goToDreamView()
        
    }
    
    func updateDream() {
        passTitle = titleField.text ?? ""
        passCurrentAmount = setStringToDecimal(
            amountValue: amountField.text?.replacingOccurrences(of: ".", with: "") ?? "")
        
        dreams[passIndex!] = Dream(id: passIndex!, title: passTitle ?? "", currentAmount: passCurrentAmount ?? 0.0, targetAmount: passTargetAmount!, progress: passProgress!)
        
    }
    
    func goToDreamView() {
        let impianTabView = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        impianTabView.modalPresentationStyle = .fullScreen
        impianTabView.modalTransitionStyle = .crossDissolve
        impianTabView.selectedIndex = 1

        self.present(impianTabView, animated: false, completion: nil)
    }
    
}

extension EditDreamViewController {
    fileprivate func setCompProperties() {
        deleteButton.layer.cornerRadius = 20
        deleteButton.layer.borderWidth = 3.0
        deleteButton.layer.borderColor = appColor.mainRed.cgColor
    }
    
}
