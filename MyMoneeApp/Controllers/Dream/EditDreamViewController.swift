//
//  EditImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditDreamViewController: UIViewController, UITextFieldDelegate {

    var passIndex: Int!
    var userData: User = AuthUser.data
    var updateButton: UIButton!
    var deleteButton: UIButton!
    var titleField: UITextField!
    var targetAmountField: UITextField!
    
    @IBOutlet var button: AnotherButton!
    @IBOutlet var formInput: FormInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Style
        deleteButton = button.secondButton
        deleteButton.setTitle("Hapus", for: .normal)
        mainDeleteButton(deleteButton)
        updateButton = button.firstButton
        updateButton.setTitle("Perbarui", for: .normal)
        enabledMainButton(updateButton)
        
        titleField = formInput.titleField
        formInput.titleLabel.text = "Judul"
        titleField.delegate = self
        
        targetAmountField = formInput.AmountField
        formInput.amountLabel.text = "Target Capaian (Rp)"
        targetAmountField.delegate = self
        
        button.delegate = self
        
        //Set Value
        titleField.text = dreams[passIndex].title
        targetAmountField.text = setDecimalToString(amountValue: dreams[passIndex].targetAmount)
        
    }
    
    //button condition
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if txtField.isEmpty || titleField.text == "" || targetAmountField.text == "" {
            disabledMainButton(updateButton)
        } else {
            enabledMainButton(updateButton)
        }
        
        return true
    }
    
    @IBAction func backTapAction(_ sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)    }
    
    func deleteDream() {
        dreams.remove(at: passIndex!)
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    func updateDreamData() {
        let title = titleField.text ?? ""
        let targetAmount = setStringToDecimal(
            amountValue: targetAmountField.text?.replacingOccurrences(of: ".", with: "") ?? "")
        
        dreams[passIndex!] = Dream(id: dreams[passIndex].id, title: title, targetAmount: targetAmount, userId: userData.id)
    }
}

extension EditDreamViewController: AnotherButtonDelegate {
    
    func firstBtnAction() {
        updateDreamData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func secondBtnAction() {
        let alert = UIAlertController(title: "Menghapus Impian", message: "Apakah anda yakin ingin menghapus impian \"\(dreams[passIndex].title)\" ?", preferredStyle: .alert)
        
        let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
            self.deleteDream()
        }
        
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}
