//
//  AddPenggunaanViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class AddPenggunaanViewController: UIViewController {

    @IBOutlet weak var pemasukanView: UIView!
    @IBOutlet weak var pengeluaranView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView()
    }
    
    @IBAction func savePenggunaan(_ sender: UIButton) {
        backNavigation()
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        backNavigation()

    }
    
    func backNavigation(){
        let mainTabViewController = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        mainTabViewController.modalPresentationStyle = .fullScreen
        mainTabViewController.modalTransitionStyle = .crossDissolve
        
        self.present(mainTabViewController, animated: false, completion: nil)
    }
    
    func categoryView(){
        pemasukanView.layer.cornerRadius = 8.0
        pemasukanView.layer.shadowColor = UIColor.black.cgColor
        pemasukanView.layer.shadowOpacity = 0.3
        pemasukanView.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        pengeluaranView.layer.cornerRadius = 8.0
        pengeluaranView.layer.shadowColor = UIColor.black.cgColor
        pengeluaranView.layer.shadowOpacity = 0.3
        pengeluaranView.layer.shadowOffset = CGSize(width: 0, height: 2)
    }


}
