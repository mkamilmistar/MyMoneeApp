//
//  DetailUsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class DetailUsageViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 20
        backButton.layer.borderWidth = 3.0
        backButton.layer.borderColor = appColor.mainPurple.cgColor
    }
    
    @IBAction func goEditUsage(_ sender: UIButton) {
        let editUsageVC = EditUsageViewController(nibName: String(describing: EditUsageViewController.self), bundle: nil)
        
        editUsageVC.modalPresentationStyle = .fullScreen
        editUsageVC.modalTransitionStyle = .coverVertical
        
        self.present(editUsageVC, animated: false)
    }
    
    @IBAction func backToHome(_ sender: UITapGestureRecognizer){
        
        self.dismiss(animated: true, completion: nil)
    }

}
