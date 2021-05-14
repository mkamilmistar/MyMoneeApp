//
//  EditImpianViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditDreamViewController: UIViewController {

    var passIndex: Int? = nil
    
    @IBOutlet weak var deleteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteButton.layer.cornerRadius = 20
        deleteButton.layer.borderWidth = 3.0
        deleteButton.layer.borderColor = appColor.mainRed.cgColor
        
    }

    @IBAction func updateButton(_ sender: Any) {
        goToDreamView()
    }
    
    @IBAction func deleteAction(_ sender: UITapGestureRecognizer) {
            let alert = UIAlertController(title: "Menghapus Impian", message: "Apakah anda yakin menghapus impian \"Membeli Airpods Baru\" ?", preferredStyle: .alert)
            
            let deleteButton = UIAlertAction(title: "Hapus", style: .destructive) { (_) -> Void in
                self.deleteDream()
            }
            
            let cancelButton = UIAlertAction(title: "Batal", style: .cancel)
            
            alert.addAction(cancelButton)
            alert.addAction(deleteButton)
            
            present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func backButton(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func deleteDream(){
        dreams.remove(at: passIndex!)
        goToDreamView()
        
    }
    
    func goToDreamView() {
        let impianTabView = MainTabController(nibName: "MainTabViewController", bundle: nil)
        
        impianTabView.modalPresentationStyle = .fullScreen
        impianTabView.modalTransitionStyle = .crossDissolve
        impianTabView.selectedIndex = 1

        self.present(impianTabView, animated: false, completion: nil)
    }
    
}
