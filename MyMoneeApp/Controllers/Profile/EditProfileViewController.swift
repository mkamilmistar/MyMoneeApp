//
//  EditProfileViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveProfile(_ gesture: UITapGestureRecognizer) {
        print("Tapp")
        let profileTab = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        profileTab.modalPresentationStyle = .fullScreen
        profileTab.modalTransitionStyle = .crossDissolve
        
        profileTab.selectedIndex = 2
        
        present(profileTab, animated: false, completion: nil)
    }
    
}
