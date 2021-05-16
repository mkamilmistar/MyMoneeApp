//
//  EditUsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditUsageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    @IBOutlet var usageTypeCollection: UICollectionView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet var titleTxtField: UITextField!
    @IBOutlet var priceTxtField: UITextField!
    @IBOutlet var updateButton: UIButton!
    private var usageTypeData: Int? 
    
    var passIndex: Int!
    var dataUser: User = AuthUser.data
    var userWallet: Wallet = AuthUser.wallet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set Style init
        enabledMainButton(updateButton)
        mainDeleteButton(deleteButton)
        
        usageTypeCollection.delegate = self
        usageTypeCollection.dataSource = self
        usageTypeCollection.allowsMultipleSelection = false
        
        let uiNib = UINib(nibName: String(describing: UsageTypeCell.self), bundle: nil)
        usageTypeCollection.register(uiNib, forCellWithReuseIdentifier: String(describing: UsageTypeCell.self))
        
        titleTxtField.delegate = self
        priceTxtField.delegate = self
        
        //Set Value
        titleTxtField.text = usages[passIndex].title
        priceTxtField.text = setDecimalToString(amountValue: usages[passIndex].price)
        
        if usages[passIndex].status == .pemasukan {
            usageTypeData = 0
        } else {
            usageTypeData = 1
        }
        
    }
    
    //button condition
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if txtField.isEmpty || usageTypeData == nil {
            disabledMainButton(updateButton)
        } else {
            enabledMainButton(updateButton)
        }
        return true
    }
    
    
    @IBAction func backToDetailUsage(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func updateButton(_ sender: Any) {
        updateUsage()
        self.present(goToMainTabByIndex(0), animated: false, completion: nil)
    }
    
    @IBAction func deleteAction(_ gesture: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Menghapus Penggunaan", message: "Apakah anda yakin ingin menghapus penggunaan \"\(usages[passIndex].title)\" ?", preferredStyle: .alert)
        
        let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
            self.deleteUsage()
        }
        
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateUsage(){
        let id = usages[passIndex].id
        let title = titleTxtField.text ?? ""
        let price = setStringToDecimal(
            amountValue: priceTxtField.text?.replacingOccurrences(of: ".", with: "") ?? "")
        let date = usages[passIndex].date
        let status: UsageType
        
        if usageTypeData == 0 {
            status = .pemasukan
            userWallet.balance = userWallet.balance + price
        } else {
            status = .pengeluaran
            userWallet.balance = userWallet.balance - price
        }

        usages[passIndex] = Usage(id: id, title: title, price: price, date: date, status: status)
        
    }
    
    func deleteUsage(){
        usages.remove(at: passIndex)
        self.present(goToMainTabByIndex(0), animated: false, completion: nil)
    }
    
    //when select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
    
        cell?.layer.borderColor = AppColor.mainPurple.cgColor
        cell?.layer.borderWidth = 3.0
        cell?.layer.cornerRadius = 8.0
        
        usageTypeData = indexPath.row
        
        if (titleTxtField.text != "") && (priceTxtField.text != "") {
            enabledMainButton(updateButton)
        }
        
    }
    
    //when deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = UIColor.white.cgColor
        usageTypeCollection.deselectItem(at: indexPath, animated: false)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryUsage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = usageTypeCollection.dequeueReusableCell(withReuseIdentifier: String(describing: UsageTypeCell.self), for: indexPath) as! UsageTypeCell
        
        //Selected in First Show
        if indexPath.row == usageTypeData {
            usageTypeCollection.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            selectBorder(cell)
        } else {
           deselectBorder(cell)
        }
        
        //Shadow View
        setShadow(cell)
        
        cell.title.text = categoryUsage[indexPath.row].label
        
        if categoryUsage[indexPath.row].type == .pemasukan {
            cell.imageStatus.image = UIImage(named: "Arrow_Up")
        }
        else if categoryUsage[indexPath.row].type == .pengeluaran{
            cell.imageStatus.image = UIImage(named: "Arrow_Down")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 75)
    }
    
}
