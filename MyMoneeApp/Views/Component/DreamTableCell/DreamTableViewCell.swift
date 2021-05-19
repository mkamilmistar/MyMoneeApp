//
//  ImpianTableViewCell.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

protocol DreamTableDelegate {
    func confirmButton(_ tag: Int)
    func deleteButton(_ tag: Int)
//    var confirmButtonStyle: UIButton { get set }
}

class DreamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet var balance: UILabel!
    @IBOutlet var targetAmount: UILabel!
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    
    var delegate: DreamTableDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        progressBar.trackTintColor = UIColor(red: 80.0/255.0, green: 105.0/255.0, blue: 184.0/255.0, alpha: 0.33)
        progressBar.progressTintColor = AppColor.mainPurple
        
        //no Select background
        self.selectionStyle = .none
        
        mainView.layer.cornerRadius = 4
        
//        confirmButton = self.delegate?.confirmButtonStyle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func confirmBtnAction(_ sender: UIButton) {
        self.delegate?.confirmButton(sender.tag)
    }
    
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        self.delegate?.deleteButton(sender.tag)
    }
}
