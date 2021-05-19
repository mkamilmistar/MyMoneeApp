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
    @IBOutlet var dreamTitle: UILabel!
    @IBOutlet var targetAmount: UILabel!
    @IBOutlet var progressAmount: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var percentProgress: UILabel!
    @IBOutlet var button: AnotherButton!
    @IBOutlet var detailBG: UIView!
    
    //Data
    var passIndex: Int!
    var passProgressData: Float? = 0.0
    var userData: User = AuthUser.data
    var backButton: UIButton!
    var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Properties of Component
        initProperties()
        
        //Conditional Button Confirm
        let percentProgressData = Int((passProgressData ?? 0.0) * 100)
        
        if percentProgressData != 100 {
            disabledMainButton(confirmButton)
        } else {
            enabledMainButton(confirmButton)
        }
        
        //Set View Variable
        let currentAmountConv = userData.balance.setDecimalToStringCurrency
        let targetAmountConv = dreams[passIndex].targetAmount.setDecimalToStringCurrency
        
        dreamTitle.text = dreams[passIndex].title
        percentProgress.text = "\(percentProgressData)%"
        
        let amount = dreams[passIndex].targetAmount.setDecimalToStringCurrency
        targetAmount.text = "Rp \(amount)"
        progressAmount.text = "IDR \(currentAmountConv) / IDR \(targetAmountConv)"
        progressBar.progress = passProgressData ?? 0.0
        
    }
    
    @IBAction func goEditImpian(_ sender: Any) {
        let editDreamVC = EditDreamViewController(nibName: String(describing: EditDreamViewController.self), bundle: nil)
        
        editDreamVC.modalPresentationStyle = .fullScreen
        editDreamVC.modalTransitionStyle = .coverVertical
        
        //Pass Data To Edit
        editDreamVC.passIndex = passIndex
        
        self.navigationController?.pushViewController(editDreamVC, animated: true)
    }
    
    func confirmAction() {
        //Save To Usage
        let id: String = String.randomCapitalizeWithNumber()
        let title: String = dreams[passIndex].title
        let price: Decimal = dreams[passIndex].targetAmount
        let status: UsageType = .moneyOut
        
        //Input To Array
        usages.append(Usage(id: id, title: title, price: price, date: Date(), status: status, UserId: userData.userId))
        
        //Delete From Dream
        dreams.remove(at: passIndex ?? 0)
        
        //Subtract Balance
        userData.balance -= price
        
        //Navigate
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension DetailDreamViewController {
    fileprivate func initProperties() {
        setShadow(detailBG)
        detailBG.layer.cornerRadius = 24
        setShadow(heartLogo)
        setShadow(progressBackground)
        button.delegate = self
        confirmButton = button.firstButton
        confirmButton.setTitle("Konfirmasi Tercapai", for: .normal)
        backButton = button.secondButton
        backButton.setTitle("Kembali", for: .normal)
        mainNoBackgroundButton(backButton)
    }
    
}

extension DetailDreamViewController: AnotherButtonDelegate {
    func firstBtnAction() {
        let alert = UIAlertController(title: "Konfirmasi Mimpi", message: "Apakah anda yakin ingin mengkonfirmasi mimpi \"\(dreams[passIndex].title)\" ?", preferredStyle: .alert)
        
        let deleteButton = UIAlertAction(title: "Konfirmasi", style: .default) { (_) -> Void in
            self.confirmAction()
        }
        
        let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    func secondBtnAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
