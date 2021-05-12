//
//  EditPenggunaanViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class EditPenggunaanViewController: UIViewController {

    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var pemasukanView: UIView!
    @IBOutlet weak var pengeluaranView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteButton.layer.cornerRadius = 20
        deleteButton.layer.borderWidth = 3.0
        deleteButton.layer.borderColor = mainRed.cgColor
        
        categoryView()
    }

    func categoryView(){
        pemasukanView.layer.cornerRadius = 8.0
        pemasukanView.layer.shadowColor = UIColor.black.cgColor
        pemasukanView.layer.shadowOpacity = 0.3
        pemasukanView.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        pengeluaranView.layer.cornerRadius = 8.0
        pengeluaranView.layer.shadowColor = UIColor.black.cgColor
        pengeluaranView.layer.shadowOpacity = 0.3
        pengeluaranView.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
