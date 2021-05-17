//
//  ProfileViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit
import Photos

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var statusUsage: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var editNameTap: UIButton!
    @IBOutlet var editPhotoButton: UIButton!
    @IBOutlet var controlLabel: UILabel!
    @IBOutlet var tapButtonPhotoAction: UITapGestureRecognizer!
    @IBOutlet var blueBg: UIView!
    
    var userData: User = AuthUser.data
    var passAllMoneyIn: Decimal = 0
    var passAllMoneyOut: Decimal = 0
    
    var imagePicker = UIImagePickerController()
    var updateName: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Set View Properties
        setView()
        
    }
    
    @IBAction func tapPhotoAction(_ sender: UITapGestureRecognizer) {
        //Pick Galery
        selectPickType()
    }
    
    @IBAction func goEditProfile(_ gesture: UITapGestureRecognizer) {
        if controlLabel.text == "Edit" {
            editMode()
        } else {
            showMode()
        }
        
    }
    
    @IBAction func editNameActionTap(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Ubah Nama", message: "Masukkan data yang ingin diupdate", preferredStyle: .alert)
            
        alert.addTextField()
        alert.textFields![0].placeholder = "Masukkan nama"
        alert.textFields![0].text = nameLabel.text

        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        let updateButton = UIAlertAction(title: "Update", style: .default, handler: {_ in (
            self.updateProfileData(alert.textFields![0].text ?? self.userData.name)
        )})
        
        alert.addAction(cancelButton)
        alert.addAction(updateButton)

        present(alert, animated: true, completion: nil)
    }
    
    func updateProfileData(_ editedData: String) {
        if editedData.isEmpty || editedData == "" {
            userData.name = userData.name
        } else {
            userData.name = editedData
            nameLabel.text = editedData
        }
       
    }
    
    func editMode() {
        editNameTap.isHidden = false
        editPhotoButton.isHidden = false
        controlLabel.text = "Selesai"
        tapButtonPhotoAction.isEnabled = true
    }
    
    func showMode() {
        editNameTap.isHidden = true
        editPhotoButton.isHidden = true
        controlLabel.text = "Edit"
        tapButtonPhotoAction.isEnabled = false
        
        //Navigate
        self.navigationController?.popToRootViewController(animated: false)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            userImage.image = image
        }

        picker.dismiss(animated: true, completion: nil)
    }
    
    func selectPickType() {
        let alert = UIAlertController(title: "Pilih Gambar", message: nil, preferredStyle: .actionSheet)

        let cameraAction = UIAlertAction(title: "Kamera", style: UIAlertAction.Style.default, handler: {_ in (
            self.openCamera()
        )})
        
        let galleryAction = UIAlertAction(title: "Galeri", style: UIAlertAction.Style.default, handler: {_ in (
            self.openGallery()
        )})
        
        let cancelAction = UIAlertAction(title: "Batal", style: UIAlertAction.Style.cancel)
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Peringatan", message: "Kamu tidak punya kamera!", preferredStyle: .alert)
            let cancelButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(cancelButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension ProfileViewController {
    fileprivate func setView() {
        //init show data
        editNameTap.isHidden = true
        editPhotoButton.isHidden = true
        tapButtonPhotoAction.isEnabled = false
        
        //Set Properties View
        nameLabel.text = userData.name
        
        view.backgroundColor = AppColor.mainBG
        blueBg.layer.backgroundColor = AppColor.mainPurple.cgColor
        
        if (passAllMoneyIn) >= (passAllMoneyOut) {
            statusUsage.text = "Bagus! Pengeluaranmu lebih sedikit dari Pemasukan"
        } else {
            statusUsage.text = "Duh! Pengeluaranmu lebih besar dari Pemasukan"
        }
    }
}
