//
//  EditUsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditUsageViewController: UIViewController {

    @IBOutlet var usageTypeCollection: UICollectionView!
    @IBOutlet var customBtn: AnotherButton!
    @IBOutlet var formInput: FormInput!
    @IBOutlet var navigationBar: NavigationBar!
    
    var updateButton: UIButton!
    var deleteButton: UIButton!
    var titleTxtField: UITextField!
    var priceTxtField: UITextField!
    private var usageTypeData: Int?
    var passIndex: Int!
    var passTransactionId: String!
    var userData: User = AuthUser.data
    var passBalance: Decimal = 0
    var serviceTransaction = TransactionService()
    var passTitle: String = ""
    var passAmount: Decimal = 0.0
    var passCreatedAt: Date!
    var passStatus: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set Style init
        initStyleView()
        
        usageTypeCollection.delegate = self
        usageTypeCollection.dataSource = self
        usageTypeCollection.allowsMultipleSelection = false
        priceTxtField.delegate = self
        titleTxtField.delegate = self
        customBtn.delegate = self
        navigationBar.delegate = self
        
        let uiNib = UINib(nibName: String(describing: UsageTypeCell.self), bundle: nil)
        usageTypeCollection.register(uiNib, forCellWithReuseIdentifier: String(describing: UsageTypeCell.self))
    }
}

extension EditUsageViewController {
    fileprivate func initStyleView() {
        updateButton = customBtn.firstButton
        updateButton.setTitle("Perbarui", for: .normal)
        
        deleteButton = customBtn.secondButton
        deleteButton.setTitle("Hapus", for: .normal)
        
        enabledMainButton(updateButton)
        mainDeleteButton(deleteButton)
        
        formInput.titleLabel.text = "Judul"
        titleTxtField = formInput.titleField
        
        formInput.amountLabel.text = "Jumlah (Rp)"
        priceTxtField = formInput.amountField
        
        navigationBar.navigationLabel.text = "Ubah Penggunaan"
        
        // Set Value
        titleTxtField.text = passTitle
        priceTxtField.text = passAmount.setDecimalToStringCurrency
        
        // Initialize Selected Value
        if passStatus == "credit" {
            usageTypeData = 0
        } else {
            usageTypeData = 1
        }
    }
    
    func updateUsage() {
        let transactionId = self.passTransactionId
        let title = titleTxtField.text ?? ""
        let amount = (priceTxtField.text?.replacingOccurrences(of: ".", with: "") ?? "").setStringToDecimal
        let date = passCreatedAt
        var status: String
        
        if usageTypeData == 0 {
            status = "credit"
            passBalance = userData.balance - passAmount
          
            if status != passStatus {
                userData.balance += amount * 2
            } else {
                userData.balance = passBalance + amount
            }
        } else {
            status = "debit"
            passBalance = userData.balance + passAmount
            
            if status != passStatus {
                userData.balance -= amount * 2
            } else {
                userData.balance = passBalance - amount
            }
        }
      
        serviceTransaction.updateTransaction(uploadDataModel: TransactionResponse(
                                    transactionId: transactionId, title: title,
                                    amount: amount, type: status, createdAt: date,
                                    updatedAt: Date())) {
            DispatchQueue.main.async {
                Helper.showToast("Penggunaan Berhasil Diubah")
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        self.loadingSpinner()
    }
    
    func deleteUsage() {
        // Balance Conditional
        if passStatus == "debit" {
            userData.balance -= passAmount
        } else {
            userData.balance += passAmount
        }
        
        guard let transactionId = passTransactionId else { return }
        
        serviceTransaction.deleteTransaction(transactionId) {
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                Helper.showToast("Penggunaan Berhasil Dihapus")
            }
        }

    }
}

extension EditUsageViewController: UITextFieldDelegate {
    // button condition
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if txtField.isEmpty || usageTypeData == nil {
            disabledMainButton(updateButton)
        } else {
            enabledMainButton(updateButton)
        }
        return true
    }
}

extension EditUsageViewController: AnotherButtonDelegate {
    func firstBtnAction() {
        updateUsage()
    }
    
    func secondBtnAction() {
        let alert = UIAlertController(
            title: "Menghapus Penggunaan",
            message: "Apakah anda yakin ingin menghapus penggunaan \"\(passTitle)\" ?",
            preferredStyle: .alert
        )
        
        let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
            self.deleteUsage()
            self.loadingSpinner()
        }
        
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension EditUsageViewController: UICollectionViewDelegate,
                                   UICollectionViewDataSource,
                                   UICollectionViewDelegateFlowLayout {
    // when select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
    
        cell?.layer.borderColor = UIColor.mainPurple().cgColor
        cell?.layer.borderWidth = 3.0
        cell?.layer.cornerRadius = 8.0
        
        usageTypeData = indexPath.row
        
        if (titleTxtField.text != "") && (priceTxtField.text != "") {
            enabledMainButton(updateButton)
        }
    }
    
    // when deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = UIColor.white.cgColor
        usageTypeCollection.deselectItem(at: indexPath, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryUsage.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = usageTypeCollection.dequeueReusableCell(
            withReuseIdentifier: String(describing: UsageTypeCell.self),
            for: indexPath) as! UsageTypeCell
        
        // Selected in First Show
        if indexPath.row == usageTypeData {
            usageTypeCollection.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            selectBorder(cell)
        } else {
           deselectBorder(cell)
        }
        
        // Shadow View
        setShadow(cell)
        
        cell.title.text = categoryUsage[indexPath.row].label
        
        if categoryUsage[indexPath.row].type == .moneyIn {
            cell.imageStatus.image = UIImage(named: "Arrow_Up")
        } else if categoryUsage[indexPath.row].type == .moneyOut {
            cell.imageStatus.image = UIImage(named: "Arrow_Down")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 75)
    }
    
}

extension EditUsageViewController: NavigationBarDelegate {
    func backBtnAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
