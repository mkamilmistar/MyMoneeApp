//
//  AddImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class AddDreamViewController: UIViewController {

    @IBOutlet var customButton: CustomButton!
    @IBOutlet var formInput: FormInput!
    
    var saveButton: UIButton!
    var titleField: UITextField!
    var targetAmountField: UITextField!
    var userData: User = AuthUser.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formInput.titleLabel.text = "Judul"
        formInput.amountLabel.text = "Target Capaian (Rp)"
        saveButton = customButton.mainButton
        saveButton.setTitle("Simpan", for: .normal)
        disabledMainButton(saveButton)
        
        titleField = formInput.titleField
        titleField.delegate = self
        targetAmountField = formInput.AmountField
        targetAmountField.delegate = self
        customButton.delegate = self
        
    }
    
    @IBAction func backButton(_ sender: UITapGestureRecognizer) {
        self.navigationController?.popToRootViewController(animated: true)
    }
       
}

extension AddDreamViewController: CustomButtonDelegate {
    func customButtonAction() {
        let id: String = NSUUID().uuidString
        let title: String = titleField.text ?? ""
        let targetAmount: Decimal = Decimal.setStringToDecimal(amountValue: targetAmountField.text ?? "")
        
        dreams.append(Dream(id: id, title: title, targetAmount: targetAmount, userId: userData.userId))
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension AddDreamViewController: UITextFieldDelegate {
    //button condition
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if txtField.isEmpty || titleField.text == "" || targetAmountField.text == "" {
            disabledMainButton(saveButton)
        } else {
            enabledMainButton(saveButton)
        }
        
        return true
    }
}
