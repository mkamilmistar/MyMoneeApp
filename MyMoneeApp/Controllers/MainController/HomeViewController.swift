//
//  HomeViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var transactionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        transactionTableView.separatorStyle = .none
        
        let uiNib = UINib(nibName: String(describing: TransactionTableViewCell.self), bundle: nil)
        transactionTableView.register(uiNib, forCellReuseIdentifier: String(describing: TransactionTableViewCell.self))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trans = tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionTableViewCell.self), for: indexPath) as! TransactionTableViewCell
        
        trans.title.text = transaction[indexPath.row].title
        trans.date.text = transaction[indexPath.row].date
        trans.price.text = transaction[indexPath.row].price
        
        if transaction[indexPath.row].status {
            trans.price.textColor = UIColor.systemRed
            trans.imageStatus.image = UIImage(named: "Arrow_Down_BG")
        } else {
            trans.price.textColor = UIColor.systemGreen
            trans.imageStatus.image = UIImage(named: "Arrow_Up_BG")
        }
        
        return trans
    }
    

}
