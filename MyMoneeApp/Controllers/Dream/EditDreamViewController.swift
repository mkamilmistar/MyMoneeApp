//
//  EditImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditDreamViewController: UIViewController {

    var passIndex: Int!
    var userData: User = AuthUser.data
    var updateButton: UIButton!
    var deleteButton: UIButton!
    var titleField: UITextField!
    var targetAmountField: UITextField!
    var dreamService = DreamService()
    
    @IBOutlet var button: AnotherButton!
    @IBOutlet var formInput: FormInput!
    @IBOutlet var navigationBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Style
        initStyleView()
        
        button.delegate = self
        titleField.delegate = self
        targetAmountField.delegate = self
        navigationBar.delegate = self
        navigationBar.navigationLabel.text = "Ubah Impian"
        
        // Set Value
        titleField.text = allDreamData[passIndex].title
        targetAmountField.text = allDreamData[passIndex].targetAmount?.setDecimalToStringCurrency
        setupLoadingView()
        
    }
    
    func deleteDream() {
        let dreamId = allDreamData[passIndex].dreamId!
        
        dreamService.deleteDream(dreamId) {
            DispatchQueue.main.async {
                Helper.showToast("Impian Berhasil Dihapus")
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    func updateDreamData() {
        let title = titleField.text ?? ""
        let targetAmount = (targetAmountField.text?.replacingOccurrences(of: ".", with: "") ?? "").setStringToDecimal
        
        loadingIndicator.isAnimating = true
        dreamService.updateDream(
            allDreamData[passIndex].dreamId ?? "",
            dreamDataModel: DreamResponse(
            dreamId: allDreamData[passIndex].dreamId,
            title: title, targetAmount: targetAmount,
                userId: allDreamData[passIndex].userId)) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                Helper.showToast("Impian Berhasil Diubah")
                loadingIndicator.isAnimating = false
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}

extension EditDreamViewController {
    fileprivate func initStyleView() {
        deleteButton = button.secondButton
        deleteButton.setTitle("Hapus", for: .normal)
        mainDeleteButton(deleteButton)
        updateButton = button.firstButton
        updateButton.setTitle("Perbarui", for: .normal)
        enabledMainButton(updateButton)
        
        titleField = formInput.titleField
        formInput.titleLabel.text = "Judul"
        
        targetAmountField = formInput.amountField
        formInput.amountLabel.text = "Target Capaian (Rp)"
    }
}

extension EditDreamViewController: AnotherButtonDelegate {
    
    func firstBtnAction() {
        updateDreamData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func secondBtnAction() {
        let alert = UIAlertController(
            title: "Menghapus Impian",
            message: "Apakah anda yakin ingin menghapus impian \"\(allDreamData[passIndex].title ?? "")\" ?",
            preferredStyle: .alert)
        
        let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
            self.deleteDream()
        }
        
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        
        present(alert, animated: true, completion: nil)
    }
}

extension EditDreamViewController: UITextFieldDelegate {
    // button condition
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if txtField.isEmpty || titleField.text == "" || targetAmountField.text == "" {
            disabledMainButton(updateButton)
        } else {
            enabledMainButton(updateButton)
        }
        
        return true
    }
}

extension EditDreamViewController: NavigationBarDelegate {
    func backBtnAction() {
        self.navigationController?.popViewController(animated: true) 
    }
}
