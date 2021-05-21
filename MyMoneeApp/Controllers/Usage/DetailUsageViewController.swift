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
    @IBOutlet var detailBG: UIView!
    
    var passIndex: Int = 0
    var dataUser: User = AuthUser.data
    var backButton: UIButton!
    var transactionService = TransactionService()
    var passTransactionId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SetStyle
        initViewStyle()
        
        initDataLoad()
        
        // Loading
        setupLoadingView()
        loadingIndicator.isAnimating = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDataDetail()
        initDataLoad()
    }
    
    @IBAction func goEditUsage(_ sender: UIButton) {
        let editUsageVC = EditUsageViewController(
            nibName: String(describing: String(describing: EditUsageViewController.self)),
            bundle: nil)
        
        editUsageVC.modalPresentationStyle = .fullScreen
        editUsageVC.modalTransitionStyle = .coverVertical
        
        // Pass Data
        editUsageVC.passIndex = self.passIndex
        editUsageVC.passTransactionId = transactionById.transactionId ?? ""
        editUsageVC.passTitle = transactionById.title ?? ""
        editUsageVC.passAmount = transactionById.amount ?? 0.0
        editUsageVC.passCreatedAt = transactionById.createdAt ?? ""
        editUsageVC.passStatus = transactionById.type ?? ""
        
        self.navigationController?.pushViewController(editUsageVC, animated: true)
    }
    
    func loadDataDetail() {
        loadingIndicator.isAnimating = true
        transactionService.getTransactionByID(transactionId: passTransactionId) { (dataTransaction) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                transactionById = dataTransaction
                self.initDataLoad()
                loadingIndicator.isAnimating = false
            }
        }
    }
    
    fileprivate func initDataLoad() {
        // setViewVariable
        idUsage.text = transactionById.transactionId
        titleUsage.text = transactionById.title
        let stringPrice = transactionById.amount?.setDecimalToStringCurrency
        
        if transactionById.type == "credit" {
            iconStatus.image = UIImage(named: "Arrow_Up_BG")
            status.text = "Pemasukan"
            price.textColor = UIColor.mainGreen()
            price.text = "+Rp \(stringPrice ?? "")"
        } else {
            iconStatus.image = UIImage(named: "Arrow_Down_BG")
            status.text = "Pengeluaran"
            price.textColor = UIColor.mainRed()
            price.text = "-Rp \(stringPrice ?? "")"
        }
        
        dateUsage.text = transactionById.createdAt?.setStringDateFormat
    }
    
}

extension DetailUsageViewController {
    
    fileprivate func initViewStyle() {
        setShadow(detailBG)
        detailBG.layer.cornerRadius = 24
        customButton.delegate = self
        backButton = customButton.mainButton
        backButton.setTitle("Kembali", for: .normal)
        mainNoBackgroundButton(backButton)
    }
}

extension DetailUsageViewController: CustomButtonDelegate {
    func customButtonAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
