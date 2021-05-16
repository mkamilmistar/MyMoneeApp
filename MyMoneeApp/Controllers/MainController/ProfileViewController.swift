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
    
    var dataUser: User = AuthUser.data
    var imagePicker = UIImagePickerController()
    var updateName: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.mainBG
        blueBg.layer.backgroundColor = AppColor.mainPurple.cgColor
        
        nameLabel.text = dataUser.name
        editNameTap.isHidden = true
        editPhotoButton.isHidden = true
        tapButtonPhotoAction.isEnabled = false

    }
    
    @IBAction func tapPhotoAction(_ sender: UITapGestureRecognizer) {
        //Pick Galery
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func goEditProfile(_ gesture: UITapGestureRecognizer) {
        if controlLabel.text == "Edit" {
            editMode()
        } else {
            showMode()
        }
        
    }
    
    @IBAction func editNameActionTap(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Ubah Nama", message: "Masukkan nama yang ingin diedit", preferredStyle: .alert)
            
        alert.addTextField()
        alert.textFields![0].placeholder = "Masukkan nama"
        alert.textFields![0].text = nameLabel.text

        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        let updateButton = UIAlertAction(title: "Update", style: .default, handler: {_ in (
            self.updateProfileData(alert.textFields![0].text ?? self.dataUser.name)
        )})
        
        alert.addAction(cancelButton)
        alert.addAction(updateButton)

        present(alert, animated: true, completion: nil)
    }
    
    func updateProfileData(_ editedData: String) {
        if editedData.isEmpty || editedData == "" {
            dataUser.name = dataUser.name
        } else {
            dataUser.name = editedData
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
        self.present(goToMainTabByIndex(2), animated: false, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.image = image
//            print(image)
        }
        
//        let photo = info[.phAsset] as? PHAsset
//        let filename = photo?.value(forKey: "filename") as? String ?? ""
//          print(filename)

        
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            let fileName = url.lastPathComponent
            let fileType = url.pathExtension
            print("fileName = \(fileName)\nfileType = \(fileType)\n")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}
