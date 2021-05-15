//
//  ProfileViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var statusUsage: UILabel!
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var editNameIcon: UIImageView!
    @IBOutlet var editPhotoButton: UIButton!
    @IBOutlet var controlLabel: UILabel!
    @IBOutlet var blueBg: UIView!
    
    var dataUser: User = AuthUser.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.mainBG
        blueBg.layer.backgroundColor = AppColor.mainPurple.cgColor
        
        userNameField.text = dataUser.name
        userNameField.isEnabled = false
        editNameIcon.isHidden = true
        editPhotoButton.isHidden = true
    }
    
    @IBAction func goEditProfile(_ gesture: UITapGestureRecognizer) {
        if controlLabel.text == "Edit" {
            editData()
        } else {
            showData()
        }
       
    }
    
    func editData(){
        userNameField.isEnabled = true
        editNameIcon.isHidden = false
        editPhotoButton.isHidden = false
        controlLabel.text = "Selesai"
    }
    
    func showData(){
        userNameField.isEnabled = false
        editNameIcon.isHidden = true
        editPhotoButton.isHidden = true
        controlLabel.text = "Edit"
        
        //Passing data
        dataUser.name = userNameField.text ?? ""
        
    }
    
   }
