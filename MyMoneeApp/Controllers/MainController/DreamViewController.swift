//
//  ImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class DreamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var impianTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: String(describing: DreamTableViewCell.self), bundle: nil)
        
        impianTableView.register(nib, forCellReuseIdentifier: String(describing: DreamTableViewCell.self))
        impianTableView.backgroundColor = appColor.mainBG
        impianTableView.delegate = self
        impianTableView.dataSource = self
    }
    
    @IBAction func addImpian(_ sender: Any) {
        let addImpianView = AddDreamViewController(nibName: String(describing: AddDreamViewController.self), bundle: nil)
        
        addImpianView.modalPresentationStyle = .fullScreen
        addImpianView.modalTransitionStyle = .coverVertical
        
        self.present(addImpianView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //deselect row animation
        tableView.deselectRow(at: indexPath, animated: false)
        
        let detailImpianViewController = DetailDreamViewController(nibName: String(describing: DetailDreamViewController.self), bundle: nil)
        
        detailImpianViewController.modalPresentationStyle = .fullScreen
        detailImpianViewController.modalTransitionStyle = .coverVertical
        
        self.present(detailImpianViewController, animated: true, completion: nil)
        
//        print("cell at #\(indexPath.row) is selected!")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dreams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = tableView.dequeueReusableCell(withIdentifier: String(describing: DreamTableViewCell.self), for: indexPath) as! DreamTableViewCell
        
        //change selected color
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGray5
        dataCell.selectedBackgroundView = backgroundView
        
        dataCell.title.text = dreams[indexPath.row].title
        dataCell.money.text = dreams[indexPath.row].targetAmount
        dataCell.progressBar.progress = dreams[indexPath.row].progress
        
        return dataCell
    }
    
}
