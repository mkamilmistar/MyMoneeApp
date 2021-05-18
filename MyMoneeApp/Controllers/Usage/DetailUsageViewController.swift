//
//  DetailUsageViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class DetailUsageViewController: UIViewController {

  
    @IBOutlet var idUsage: UILabel!
    @IBOutlet var iconStatus: UIImageView!
    @IBOutlet var titleUsage: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var dateUsage: UILabel!
    @IBOutlet var customButton: CustomButton!
    
    var passIndex: Int = 0
    var dataUser: User = AuthUser.data
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //SetStyle
        customButton.delegate = self
        backButton = customButton.mainButton
        backButton.setTitle("Kembali", for: .normal)
        mainNoBackgroundButton(backButton)
        
        //setViewVariable
        idUsage.text = usages[passIndex].id
        titleUsage.text = usages[passIndex].title
        let stringPrice = setDecimalToString(amountValue: usages[passIndex].amount)
        
        if usages[passIndex].status == .moneyIn {
            iconStatus.image = UIImage(named: "Arrow_Up_BG")
            status.text = "Pemasukan"
            price.textColor = AppColor.mainGreen
            price.text = "+Rp \(stringPrice)"
         
        } else {
            iconStatus.image = UIImage(named: "Arrow_Down_BG")
            status.text = "Pengeluaran"
            price.textColor = AppColor.mainRed
            price.text = "-Rp \(stringPrice)"

        }
        
        dateUsage.text = setDateToString(usages[passIndex].date)
       
    }
    
    @IBAction func goEditUsage(_ sender: UIButton) {
        let editUsageVC = EditUsageViewController(nibName: String(describing: String(describing: EditUsageViewController.self)), bundle: nil)
        
        editUsageVC.modalPresentationStyle = .fullScreen
        editUsageVC.modalTransitionStyle = .coverVertical
        
        //Pass Data
        editUsageVC.passIndex = self.passIndex
        
        self.navigationController?.pushViewController(editUsageVC, animated: true)
    }

}

extension DetailUsageViewController: CustomButtonDelegate {
    func anotherCustomBtnAction() {
        //
    }
    
    func customButtonAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
