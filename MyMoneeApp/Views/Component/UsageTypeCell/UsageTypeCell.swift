//
//  UsageTypeCell.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class UsageTypeCell: UICollectionViewCell {

    
    @IBOutlet var imageStatus: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var background: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        background.layer.cornerRadius = 8.0
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shadowOpacity = 0.3
        background.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    

}
