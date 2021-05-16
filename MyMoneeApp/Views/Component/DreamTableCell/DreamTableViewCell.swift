//
//  ImpianTableViewCell.swift
//  MyMoneeApp
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class DreamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var menuAction: UIImageView!
    @IBOutlet var balance: UILabel!
    @IBOutlet var targetAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        progressBar.trackTintColor = UIColor(red: 80.0/255.0, green: 105.0/255.0, blue: 184.0/255.0, alpha: 0.33)
        progressBar.progressTintColor = AppColor.mainPurple
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
