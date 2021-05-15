//
//  ProfileViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = appColor.mainBG
        // Do any additional setup after loading the view.
    }


    @IBAction func goEditProfile(_ gesture: UITapGestureRecognizer) {
        let editProfile = EditProfileViewController(nibName: String(describing: EditProfileViewController.self), bundle: nil)
        
        editProfile.modalPresentationStyle = .fullScreen
        
        present(editProfile, animated: false, completion: nil)
    }
    
   }
