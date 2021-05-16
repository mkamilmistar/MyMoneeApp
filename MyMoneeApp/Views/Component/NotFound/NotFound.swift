//
//  NotFound.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

class NotFound: UIView {

    @IBOutlet var mainContent: UIView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var notFoundLabel: UILabel!
    
    //Constructor dengan programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    //consturctor dengan interface builder (storyBoard)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NotFound", owner: self, options: nil)
        addSubview(mainContent)
        mainContent.frame = self.bounds
        mainContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        
        enabledMainButton(addButton)
        
        notFoundLabel.textColor = UIColor(red: 79.0/255.0, green: 79.0/255.0, blue: 79.0/255.0, alpha: 1.0)
    }
}
