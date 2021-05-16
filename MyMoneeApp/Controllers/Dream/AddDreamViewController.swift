//
//  AddImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class AddDreamViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var targetAmountField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disabledMainButton(saveButton)

        titleField.delegate = self
        targetAmountField.delegate = self
        
    }
    
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
    
    @IBAction func backButton(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let lastIndex = dreams.endIndex
        let id: Int = lastIndex + 1
        let title: String = titleField.text ?? ""
        let targetAmount: Decimal = setStringToDecimal(amountValue: targetAmountField.text ?? "")
        
        dreams.append(Dream(id: id, title: title, targetAmount: targetAmount))
        
        self.present(goToMainTabByIndex(1), animated: false, completion: nil)
    }
}
