//
//  AddImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class AddDreamViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var targetAmountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButton(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let lastIndex = dreams.endIndex
        let id: Int = lastIndex + 1
        let title: String = titleField.text ?? ""
        let targetAmount: Decimal = setStringToDecimal(amountValue: targetAmountField.text ?? "")
        
        dreams.append(Dream(id: id, title: title, currentAmount: 0.0, targetAmount: targetAmount, progress: 0.0))
        
//        print(title)
        
        let dreamVC = MainTabController(nibName: String(describing: MainTabController.self), bundle: nil)
        dreamVC.modalPresentationStyle = .fullScreen
        dreamVC.selectedIndex = 1
        
        self.present(dreamVC, animated: false, completion: nil)
    }
}
