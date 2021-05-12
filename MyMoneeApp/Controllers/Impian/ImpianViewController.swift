//
//  ImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class ImpianViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var impianTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: String(describing: ImpianTableViewCell.self), bundle: nil)
        
        impianTableView.register(nib, forCellReuseIdentifier: String(describing: ImpianTableViewCell.self))
        
        impianTableView.delegate = self
        impianTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return impian.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImpianTableViewCell.self), for: indexPath) as! ImpianTableViewCell
        
        dataCell.title.text = impian[indexPath.row].title
        dataCell.money.text = impian[indexPath.row].price
        dataCell.progressBar.progress = impian[indexPath.row].progress
        
        
        return dataCell
    }
    
}
