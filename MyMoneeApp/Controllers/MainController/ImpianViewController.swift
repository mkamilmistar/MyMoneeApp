//
//  ImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class ImpianViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var impianTableView: UITableView!
    let selectedColor   = UIColor(red: 240.0/255.0, green: 242.0/255.0, blue: 248.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: String(describing: ImpianTableViewCell.self), bundle: nil)
        
        impianTableView.register(nib, forCellReuseIdentifier: String(describing: ImpianTableViewCell.self))
        impianTableView.backgroundColor = selectedColor
        impianTableView.delegate = self
        impianTableView.dataSource = self
    }
    
    @IBAction func addImpian(_ sender: Any) {
        let addImpianView = AddImpianViewController(nibName: "AddImpianViewController", bundle: nil)
        
        addImpianView.modalPresentationStyle = .fullScreen
        addImpianView.modalTransitionStyle = .coverVertical
        
        self.present(addImpianView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //deselect row animation
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailImpianViewController = DetailImpianlViewController(nibName: "DetailImpianViewController", bundle: nil)
        
        detailImpianViewController.modalPresentationStyle = .fullScreen
        detailImpianViewController.modalTransitionStyle = .coverVertical
        
        self.present(detailImpianViewController, animated: true, completion: nil)
        
        print("cell at #\(indexPath.row) is selected!")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return impian.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImpianTableViewCell.self), for: indexPath) as! ImpianTableViewCell
        
        //change selected color
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGray5
        dataCell.selectedBackgroundView = backgroundView
        
        
        dataCell.title.text = impian[indexPath.row].title
        dataCell.money.text = impian[indexPath.row].price
        dataCell.progressBar.progress = impian[indexPath.row].progress
        
        
        return dataCell
    }
    
}
