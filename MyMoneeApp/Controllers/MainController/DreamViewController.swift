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
        
        let detailDreamVC = DetailDreamViewController(nibName: String(describing: DetailDreamViewController.self), bundle: nil)
        
        detailDreamVC.modalPresentationStyle = .fullScreen
        detailDreamVC.modalTransitionStyle = .coverVertical
        
        //Passing Data
        detailDreamVC.passTitle = dreams[indexPath.row].title
        detailDreamVC.passCurrentAmount = dreams[indexPath.row].currentAmount
        detailDreamVC.passTargetAmount = dreams[indexPath.row].targetAmount
        detailDreamVC.passIndex = indexPath.row
        let progress = setProgress(indexPath)
        detailDreamVC.passProgress = progress
        
        self.present(detailDreamVC, animated: true, completion: nil)
        
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
        
        dataCell.currentAmount.text = setAmountString(amountValue: dreams[indexPath.row].currentAmount)
        dataCell.targetAmount.text = setAmountString(amountValue: dreams[indexPath.row].targetAmount)
        
        let progress = setProgress(indexPath)
        
        dataCell.progressBar.progress = progress
        
        return dataCell
    }
    
}

extension DreamViewController {
    fileprivate func setProgress(_ indexPath: IndexPath) -> Float {
        let currentDouble = setDecimalToDouble(value: dreams[indexPath.row].currentAmount)
        let targetDouble = setDecimalToDouble(value: dreams[indexPath.row].targetAmount)
        
        dreams[indexPath.row].progress = Float(currentDouble / targetDouble)
        let progress = dreams[indexPath.row].progress
        return progress
    }
}
