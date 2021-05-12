//
//  DetailPenggunaanViewController.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class DetailPenggunaanViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 20
        backButton.layer.borderWidth = 3.0
        backButton.layer.borderColor = mainPurple.cgColor
    }

}
