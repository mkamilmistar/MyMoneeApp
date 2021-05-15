//
//  TableViewCell.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class UsageTableViewCell: UITableViewCell {

   
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageStatus: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        date.textColor = AppColor.mainGrey
    }
}
