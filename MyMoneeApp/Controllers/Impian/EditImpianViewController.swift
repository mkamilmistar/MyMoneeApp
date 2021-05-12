//
//  EditImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditImpianViewController: UIViewController {

    @IBOutlet weak var deleteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteButton.layer.cornerRadius = 20
        deleteButton.layer.borderWidth = 3.0
        deleteButton.layer.borderColor = mainRed.cgColor
        
    }

    @IBAction func updateButton(_ sender: Any) {
        backToImpianView()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        backToImpianView()
    }
    
    @IBAction func backButton(_ sender: Any) {
        backToImpianView()
    }
    
    func backToImpianView(){
        let mainTabViewController = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        mainTabViewController.modalPresentationStyle = .fullScreen
        mainTabViewController.modalTransitionStyle = .crossDissolve
        
        self.present(mainTabViewController, animated: false, completion: nil)
    }
    
}
