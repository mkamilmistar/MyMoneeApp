//
//  AddImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class AddImpianViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: UITapGestureRecognizer) {
        backToImpianView()
    }
    
    @IBAction func saveButton(_ sender: Any) {
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
