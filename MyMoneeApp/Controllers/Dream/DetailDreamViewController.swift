//
//  ImpianDetailViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class DetailDreamViewController: UIViewController {

    @IBOutlet weak var heartLogo: UIView!
    @IBOutlet weak var progressBackground: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet var dreamTitle: UILabel!
    @IBOutlet var currentAmount: UILabel!
    @IBOutlet var progressAmount: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    //Data
    var passIndex: Int? = nil
    var passTitle: String? = ""
    var passProgress: Float? = 0.0
    
    var passCurrentAmount: Decimal? = 0.0
    var passTargetAmount: Decimal? = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCompProperties()
        
        let currentAmountConv = setAmountString(amountValue: passCurrentAmount!)
        let targetAmountConv = setAmountString(amountValue: passTargetAmount!)
        
        //Set View Variable
        dreamTitle.text = passTitle
        currentAmount.text = anotherSetAmountString(amountValue: passCurrentAmount!)
        progressAmount.text = "\(currentAmountConv) / \(targetAmountConv)"
        
        progressBar.progress = passProgress ?? 0.0
        
    }
    
    @IBAction func goEditImpian(_ sender: Any) {
        let editDreamVC = EditDreamViewController(nibName: "EditDreamViewController", bundle: nil)
        
        editDreamVC.modalPresentationStyle = .fullScreen
        editDreamVC.modalTransitionStyle = .coverVertical
        editDreamVC.passIndex = passIndex
        
        self.present(editDreamVC, animated: false, completion: nil)
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        let impianTabView = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        impianTabView.modalPresentationStyle = .fullScreen
        impianTabView.modalTransitionStyle = .crossDissolve
        impianTabView.selectedIndex = 1
        
        self.present(impianTabView, animated: false, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
}

extension DetailDreamViewController {
    fileprivate func setCompProperties() {
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
        backButton.layer.borderColor = appColor.mainPurple.cgColor
    }
    
}
