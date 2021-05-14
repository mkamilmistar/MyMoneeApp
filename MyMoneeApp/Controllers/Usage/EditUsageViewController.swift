//
//  EditUsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditUsageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    @IBOutlet var pemasukanTypeCollection: UICollectionView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet var titleTxtField: UITextField!
    @IBOutlet var priceTxtField: UITextField!
    @IBOutlet var updateButton: UIButton!
    private var pemasukanType: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activedButton()
        pemasukanTypeCollection.delegate = self
        pemasukanTypeCollection.dataSource = self
        pemasukanTypeCollection.allowsMultipleSelection = false
        
        let uiNib = UINib(nibName: String(describing: UsageTypeCell.self), bundle: nil)
        pemasukanTypeCollection.register(uiNib, forCellWithReuseIdentifier: String(describing: UsageTypeCell.self))

        deleteButton.layer.cornerRadius = 20
        deleteButton.layer.borderWidth = 3.0
        deleteButton.layer.borderColor = appColor.mainRed.cgColor
        
        titleTxtField.delegate = self
        priceTxtField.delegate = self
        
    }
    
    //button condition
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if txtField.isEmpty || pemasukanType == nil {
            disabledButton()
        } else {
            activedButton()
        }
        return true
    }
    
    func activedButton() {
        updateButton.isUserInteractionEnabled = true
        updateButton.isEnabled = true
        updateButton.backgroundColor = appColor.mainPurple
    }
    
    func disabledButton() {
        updateButton.isUserInteractionEnabled = false
        updateButton.isEnabled = false
        updateButton.backgroundColor = appColor.disabledButton
    }
    
    @IBAction func backToDetailUsage(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func updateUsage(_ sender: Any) {
        goBackToHome()
    }
    
    @IBAction func deleteAction(_ gesture: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Menghapus Penggunaan", message: "Apakah anda yakin menghapus penggunaan \"Gaji\" ?", preferredStyle: .alert)
        
        let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
            self.goBackToHome()
        }
        
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func goBackToHome() {
        let mainTabViewController = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        mainTabViewController.modalPresentationStyle = .fullScreen
        mainTabViewController.modalTransitionStyle = .crossDissolve
        
        self.present(mainTabViewController, animated: false, completion: nil)
    }
    
    //when select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = appColor.mainPurple.cgColor
        cell?.layer.borderWidth = 3.0
        cell?.layer.cornerRadius = 8.0
        
        pemasukanType = indexPath.row
        
        if (titleTxtField.text != "") && (priceTxtField.text != "") {
            activedButton()
        }
        print("Ini isi tipe = \(pemasukanType!)")
    }
    
    //when deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = UIColor.white.cgColor
        pemasukanTypeCollection.deselectItem(at: indexPath, animated: false)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usagesType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pemasukanTypeCollection.dequeueReusableCell(withReuseIdentifier: String(describing: UsageTypeCell.self), for: indexPath) as! UsageTypeCell
        
        //Selected in First Show
        if indexPath.row == pemasukanType {
            pemasukanTypeCollection.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            cell.layer.borderColor = appColor.mainPurple.cgColor
            cell.layer.borderWidth = 3.0
            cell.layer.cornerRadius = 8.0
        } else {
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.white.cgColor
        }
        
        //Shadow View
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
    
}
