//
//  ImpianDetailViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class DetailImpianlViewController: UIViewController {

    @IBOutlet weak var heartLogo: UIView!
    @IBOutlet weak var progressBackground: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heartLogo.layer.cornerRadius = 8.0
        heartLogo.layer.shadowColor = UIColor.black.cgColor
        heartLogo.layer.shadowOpacity = 0.3
        heartLogo.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        progressBackground.layer.cornerRadius = 8.0
        progressBackground.layer.shadowColor = UIColor.black.cgColor
        progressBackground.layer.shadowOpacity = 0.3
        progressBackground.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        backButton.layer.cornerRadius = 20
        backButton.layer.borderWidth = 3.0
        backButton.layer.borderColor = mainPurple.cgColor
        
    }
    
    @IBAction func goEditImpian(_ sender: Any) {
        let editImpianView = EditImpianViewController(nibName: "EditImpianViewController", bundle: nil)
        
        editImpianView.modalPresentationStyle = .fullScreen
        editImpianView.modalTransitionStyle = .coverVertical
        
        self.present(editImpianView, animated: false, completion: nil)
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        backToImpianView()
    }
    
    @IBAction func backButton(_ sender: Any) {
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
