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
    @IBOutlet var confirmButton: UIButton!
    
    @IBOutlet var dreamTitle: UILabel!
    @IBOutlet var currentAmount: UILabel!
    @IBOutlet var progressAmount: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var percentProgress: UILabel!

    
    //Data
    var passIndex: Int? = nil
    var passTitle: String? = ""
    var passProgress: Float? = 0.0
    var passCurrentAmount: Decimal? = 0.0
    var passTargetAmount: Decimal? = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Properties of Component
        setShadow(heartLogo)
        setShadow(progressBackground)
        mainNoBackgroundButton(backButton)
        
        let currentAmountConv = setAmountString(amountValue: passCurrentAmount!)
        let targetAmountConv = setAmountString(amountValue: passTargetAmount!)
        
        //Conditional Button Confirm
        let progress = Int((passProgress ?? 0.0) * 100)

        if progress != 100 {
            disabledMainButton(confirmButton)
        } else {
            enabledMainButton(confirmButton)
        }
        print()
        //Set View Variable
        dreamTitle.text = passTitle
        percentProgress.text = "\(progress)%"
        currentAmount.text = anotherSetAmountString(amountValue: passCurrentAmount!)
        progressAmount.text = "\(currentAmountConv) / \(targetAmountConv)"
        progressBar.progress = passProgress ?? 0.0
        
    }
    
    
    @IBAction func goEditImpian(_ sender: Any) {
        let editDreamVC = EditDreamViewController(nibName: String(describing: EditDreamViewController.self), bundle: nil)
        
        editDreamVC.modalPresentationStyle = .fullScreen
        editDreamVC.modalTransitionStyle = .coverVertical
        
        //Pass Data To Edit
        editDreamVC.passIndex = self.passIndex
        editDreamVC.passTitle = self.passTitle
        editDreamVC.passCurrentAmount = self.passCurrentAmount
        editDreamVC.passTargetAmount = self.passTargetAmount
        editDreamVC.passProgress = self.passProgress

        
        self.present(editDreamVC, animated: false, completion: nil)
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        dreams.remove(at: passIndex!)
        
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
        
    }
    
}
