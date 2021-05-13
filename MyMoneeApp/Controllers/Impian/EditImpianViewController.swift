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
        deleteButton.layer.borderColor = appColor.mainRed.cgColor
        
    }

    @IBAction func updateButton(_ sender: Any) {
        backToImpianView()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        backToImpianView()
    }
    
    @IBAction func backButton(_ sender: UITapGestureRecognizer) {
        backToImpianView()
    }
    
    func backToImpianView(){
        let impianTabView = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        impianTabView.modalPresentationStyle = .fullScreen
        impianTabView.modalTransitionStyle = .crossDissolve
        impianTabView.selectedIndex = 1

        
        self.present(impianTabView, animated: false, completion: nil)
    }
    
}
