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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        disabledButton()
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

        if txtField.isEmpty || usageTypeData == nil {
            disabledButton()
        } else {
            activedButton()
        }
        return true
    }
    
    func activedButton() {
        saveButton.isUserInteractionEnabled = true
        saveButton.isEnabled = true
        saveButton.backgroundColor = appColor.mainPurple
    }
    
    func disabledButton() {
        saveButton.isUserInteractionEnabled = false
        saveButton.isEnabled = false
        saveButton.backgroundColor = appColor.disabledButton
    }
    
    //when select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = appColor.mainPurple.cgColor
        cell?.layer.borderWidth = 3.0
        cell?.layer.cornerRadius = 8.0
        usageTypeData = indexPath.row
        if (titleTxtField.text != "") && (priceTxtField.text != "") {
            activedButton()
        }
        print("Ini isi tipe = \(usageTypeData!)")
    }
    
    //when deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = UIColor.white.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usagesType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = usagesTypeCollection.dequeueReusableCell(withReuseIdentifier: String(describing: UsageTypeCell.self), for: indexPath) as! UsageTypeCell
        
        cell.background.layer.cornerRadius = 8.0
        cell.background.layer.shadowColor = UIColor.black.cgColor
        cell.background.layer.shadowOpacity = 0.3
        cell.background.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.title.text = usagesType[indexPath.row].title
        
        if usagesType[indexPath.row].type == .pemasukan {
            cell.imageStatus.image = UIImage(named: "Arrow_Up")
        } else {
            cell.imageStatus.image = UIImage(named: "Arrow_Down")
        }
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 75)
    }
    
    @IBAction func BackToHome(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveUsage(_ sender: UIButton) {
        backNavigation()
    }

    func backNavigation(){
        let mainTabViewController = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        mainTabViewController.modalPresentationStyle = .fullScreen
        mainTabViewController.modalTransitionStyle = .crossDissolve
        
        self.present(mainTabViewController, animated: false, completion: nil)
    }
}
