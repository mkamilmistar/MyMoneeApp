//
//  AddUsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class AddUsageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    @IBOutlet var usagesTypeCollection: UICollectionView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var titleTxtField: UITextField!
    @IBOutlet var priceTxtField: UITextField!
    var usageTypeData: Int? = nil
    var dataUser: User = AuthUser.data
        
    override func viewDidLoad() {
        super.viewDidLoad()
        disabledMainButton(saveButton)
        usagesTypeCollection.delegate = self
        usagesTypeCollection.dataSource = self
        usagesTypeCollection.allowsMultipleSelection = false
        
        let uiNib = UINib(nibName: String(describing: UsageTypeCell.self), bundle: nil)
        usagesTypeCollection.register(uiNib, forCellWithReuseIdentifier: String(describing: UsageTypeCell.self))
        
        titleTxtField.delegate = self
        priceTxtField.delegate = self
        
    }
    
    //button condition
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if txtField.isEmpty || usageTypeData == nil || titleTxtField.text == "" || priceTxtField.text == "" {
            disabledMainButton(saveButton)
        } else {
            enabledMainButton(saveButton)
        }
        return true
    }
    
    @IBAction func BackToHome(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveUsage(_ sender: UIButton) {
        let id: String = String.random()
        let title: String = titleTxtField.text ?? ""
        let price: Decimal = setStringToDecimal(amountValue: priceTxtField.text ?? "")
        let status: UsageType
        
        if usageTypeData == 0 {
            status = categoryUsage[usageTypeData ?? 0].type
        } else {
            status = categoryUsage[usageTypeData ?? 0].type
        }
        
        //Input To Array
        usages.append(Usage(id: id, title: title, price: price, date: "15 Mei 2021 - 15.30", status: status))
        
        debitBalance(status, price)
        
        backNavigation()
    }

    fileprivate func debitBalance(_ status: UsageType, _ price: Decimal) {
        //Akumulasi
        if status == .pengeluaran {
            dataUser.balance = dataUser.balance - price
        } else {
            dataUser.balance = dataUser.balance + price
        }
    }
    
    func backNavigation(){
        let mainTabViewController = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        mainTabViewController.modalPresentationStyle = .fullScreen
        mainTabViewController.modalTransitionStyle = .crossDissolve
        
        self.present(mainTabViewController, animated: false, completion: nil)
    }
    
    //when select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = AppColor.mainPurple.cgColor
        cell?.layer.borderWidth = 3.0
        cell?.layer.cornerRadius = 8.0
        usageTypeData = indexPath.row
        if (titleTxtField.text != "") && (priceTxtField.text != "") {
            enabledMainButton(saveButton)
        }
        
    }
    
    //when deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = UIColor.white.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryUsage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = usagesTypeCollection.dequeueReusableCell(withReuseIdentifier: String(describing: UsageTypeCell.self), for: indexPath) as! UsageTypeCell
        
        setShadow(cell)
        
        cell.title.text = categoryUsage[indexPath.row].label
        
        if categoryUsage[indexPath.row].type == .pemasukan {
            cell.imageStatus.image = UIImage(named: categoryUsage[indexPath.row].icon)
        } else {
            cell.imageStatus.image = UIImage(named: categoryUsage[indexPath.row].icon)
        }
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 75)
    }
    
}

extension String {
    static func random(length: Int = 6) -> String {
        let base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return "MM-\(randomString)"
    }
}
