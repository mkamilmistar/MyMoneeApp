//
//  HomeViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class HomeViewController: UIViewController {
   
    @IBOutlet var notFound: NotFound!
    @IBOutlet var usagesTableView: UITableView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var balanceView: UIView!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var totalUsageIn: UILabel!
    @IBOutlet var totalUsageOut: UILabel!
    @IBOutlet var riwayatPenggunaanLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet var historyBackground: UIView!
    @IBOutlet var headerView: Header!
    
    var service = TransactionService()

    var userData: User = AuthUser.data
    var totalMoneyIn: Decimal = 0.0
    var totalMoneyOut: Decimal = 0.0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set View Style
        setViewStyle()
        
        // Register Table
        let uiNib = UINib(nibName: String(describing: UsageTableViewCell.self), bundle: nil)
        usagesTableView.register(uiNib, forCellReuseIdentifier: String(describing: UsageTableViewCell.self))
        usagesTableView.delegate = self
        usagesTableView.dataSource = self
        notFound.delegate = self
        headerView.delegate = self
        
//        service.loadTransactionList { (_) in
//            print("dapet")
//        }
    }
    
    func loadData() {
        service.getTransaction { (transactionList) in
            DispatchQueue.main.async {
                transactions = transactionList
                print(transactions)
                self.dataNotFound()
                // Money In Out
                self.calcualateMoneyByType()
                self.usagesTableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Load Data Transaction
        loadData()

        dataNotFound()
        usagesTableView.reloadData()
        
        userName.text = userData.name

        // Set Data Greeting
        schedulerGreetingText()

        passingDataToProfile()

    }
}

extension HomeViewController {
    fileprivate func calcualateMoneyByType() {
        // Get All Data In and Out
        totalMoneyIn = transactions.filter({$0.type == "credit"}).map({$0.amount}).reduce(0, +)
        totalMoneyOut = transactions.filter({$0.type == "debit"}).map({$0.amount}).reduce(0, +)

        let dataUsageIn = totalMoneyIn.setDecimalToStringCurrency
        let dataUsageOut = totalMoneyOut.setDecimalToStringCurrency
        
        // Set Data Show
        totalUsageIn.text = "Rp. \(dataUsageIn)"
        totalUsageOut.text = "Rp. \(dataUsageOut)"
        
        // Balance User
        balanceLabel.text = "Rp \((totalMoneyIn - totalMoneyOut).setDecimalToStringCurrency)"
    }
    
    fileprivate func passingDataToProfile() {
        // Pass Data In/Out To Profile Tab Menu
        let navVC = tabBarController?.viewControllers![2] as! UINavigationController
        let profileVC = navVC.topViewController as! ProfileViewController
        profileVC.passAllMoneyIn = totalMoneyIn
        profileVC.passAllMoneyOut = totalMoneyOut
    }
    
    fileprivate func setViewStyle() {
        usagesTableView.separatorStyle = .none
        usagesTableView.backgroundColor = .white
        historyBackground.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        setShadow(historyBackground)
        historyBackground.layer.cornerRadius = 24
        
        headerView.headerLabel.text = "Selamat Pagi"

        contentView.backgroundColor = UIColor.mainBG()
        view.backgroundColor = UIColor.mainBG()
        balanceView.backgroundColor = UIColor.mainPurple()
        notFound.isHidden = true
        notFound.addButton.isHidden = true
        notFound.addButton.setTitle("Tambah Penggunaan", for: .normal)
    }
    
    func addData() {
        let addUsageVC = AddUsageViewController(nibName: String(describing: AddUsageViewController.self), bundle: nil)
        
        addUsageVC.modalPresentationStyle = .fullScreen
        addUsageVC.modalTransitionStyle = .coverVertical
        addUsageVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addUsageVC, animated: true)
    }
    
    // Scheduler the Greeting Text
    fileprivate func schedulerGreetingText() {
        let time = Date().hour
        
        switch time {
        case 1..<12: self.headerView.headerLabel.text = "Selamat Pagi,"
        case 12..<15: self.headerView.headerLabel.text = "Selamat Siang,"
        case 15..<18: self.headerView.headerLabel.text = "Selamat Sore,"
        case 18..<24: self.headerView.headerLabel.text = "Selamat Malam,"
        default:self.headerView.headerLabel.text = "Selamat Dini Hari,"
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // deselect row animation
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailUsageVC = DetailUsageViewController(
            nibName: String(describing: DetailUsageViewController.self),
            bundle: nil)
        
        detailUsageVC.modalPresentationStyle = .fullScreen
        detailUsageVC.modalTransitionStyle = .coverVertical
        
        // PassingData
        detailUsageVC.passIndex = indexPath.row
        detailUsageVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailUsageVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if usages.count > 0 {
            return transactions.count
        } else {
            self.usagesTableView.isHidden = true
            self.notFound.isHidden = false
            self.notFound.addButton.isHidden = false
            self.riwayatPenggunaanLabel.isHidden = true
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trans = tableView.dequeueReusableCell(
            withIdentifier: String(describing: UsageTableViewCell.self),
            for: indexPath) as! UsageTableViewCell
        
        // change selected color
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGray5
        trans.selectedBackgroundView = backgroundView
        
        // Set Data Cell
        trans.title.text = transactions[indexPath.row].title
        trans.date.text = transactions[indexPath.row].createdAt.setDateToString
        let price = transactions[indexPath.row].amount.setDecimalToStringCurrency
       
        if transactions[indexPath.row].type == "debit" {
            trans.imageStatus.image = UIImage(named: "Arrow_Down_BG")
            trans.price.textColor = UIColor.mainRed()
            trans.price.text = "-Rp \(price)"
        } else {
            trans.price.textColor = UIColor.systemGreen
            trans.imageStatus.image = UIImage(named: "Arrow_Up_BG")
            trans.price.textColor = UIColor.mainGreen()
            trans.price.text = "+Rp \(price)"
        }
        return trans
    }
}

extension HomeViewController: HeaderDelegate, NotFoundDelegate {
    func headerButtonAction() {
        addData()
    }
    
    func notFoundButtonAction() {
        addData()
    }
    
    func dataNotFound() {
        if transactions.count > 0 {
            self.usagesTableView.isHidden = false
            self.notFound.isHidden = true
            self.notFound.addButton.isHidden = true
            self.riwayatPenggunaanLabel.isHidden = false
        } else {
            self.usagesTableView.isHidden = true
            self.notFound.isHidden = false
            self.notFound.addButton.isHidden = false
            self.riwayatPenggunaanLabel.isHidden = true
        }
    }
}
