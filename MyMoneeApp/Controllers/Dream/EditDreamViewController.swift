//
//  EditImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditDreamViewController: UIViewController, UITextFieldDelegate {

    var passIndex: Int? = nil
    var passTitle: String? = ""
    var passProgress: Float? = 0.0
    var passCurrentAmount: Decimal? = 0.0
    var passTargetAmount: Decimal? = 0.0
    
    @IBOutlet var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var currentAmountField: UITextField!
    @IBOutlet var targetAmountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Style
        mainDeleteButton(deleteButton)
        enabledMainButton(updateButton)
        
        titleField.delegate = self
        currentAmountField.delegate = self
        
        //Set Value
        titleField.text = passTitle
        currentAmountField.text = setDecimalToString(amountValue: passCurrentAmount ?? 0.0)
        targetAmountField.text = setDecimalToString(amountValue: passTargetAmount ?? 0.0)
        
    }
    
    //button condition
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if txtField.isEmpty || titleField.text == "" || currentAmountField.text == "" {
            disabledMainButton(updateButton)
        } else {
            enabledMainButton(updateButton)
        }
        
        return true
    }
    
    @IBAction func updateButton(_ sender: UIButton) {
        updateDream()
        goToDreamView()
    }
    
    @IBAction func deleteAction(_ sender: UITapGestureRecognizer) {
            let alert = UIAlertController(title: "Menghapus Impian", message: "Apakah anda yakin menghapus impian \"\(passTitle ?? "")\" ?", preferredStyle: .alert)
            
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
            amountValue: currentAmountField.text?.replacingOccurrences(of: ".", with: "") ?? "")
        passTargetAmount = setStringToDecimal(
            amountValue: targetAmountField.text?.replacingOccurrences(of: ".", with: "") ?? "")
        
        dreams[passIndex!] = Dream(id: passIndex!, title: passTitle ?? "", currentAmount: passCurrentAmount ?? 0.0, targetAmount: passTargetAmount!, progress: passProgress!)
        
    }
    
    func goToDreamView() {
        let impianTabView = MainTabController(nibName: String(describing: MainTabController.self), bundle: nil)
        
        impianTabView.modalPresentationStyle = .fullScreen
        impianTabView.modalTransitionStyle = .crossDissolve
        impianTabView.selectedIndex = 1

        self.present(impianTabView, animated: false, completion: nil)
    }
    
}
