//
//  NotFound.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

class NotFound: UIView {

    @IBOutlet var mainContent: UIView!
    @IBOutlet var notFoundImage: UIImageView!
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
    }
}
