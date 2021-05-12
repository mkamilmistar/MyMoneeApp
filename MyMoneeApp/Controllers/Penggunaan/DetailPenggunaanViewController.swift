//
//  DetailPenggunaanViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class DetailPenggunaanViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 20
        backButton.layer.borderWidth = 3.0
        backButton.layer.borderColor = mainPurple.cgColor
    }
    
    @IBAction func goEditPenggunaan(_ sender: UIButton) {
        let editPenggunaanViewController = EditPenggunaanViewController(nibName: "EditPenggunaanViewController", bundle: nil)
        
        editPenggunaanViewController.modalPresentationStyle = .fullScreen
        editPenggunaanViewController.modalTransitionStyle = .coverVertical
        
        self.present(editPenggunaanViewController, animated: false)
    }
    
    @IBAction func backToHome(_ sender: AnyObject){
        let mainTabViewController = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        mainTabViewController.modalPresentationStyle = .fullScreen
        mainTabViewController.modalTransitionStyle = .crossDissolve
        
        self.present(mainTabViewController, animated: false, completion: nil)
    }

}
