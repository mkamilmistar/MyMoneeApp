//
//  MainButton.swift
//  MyMoneeApp
//
//  Created by MacBook on 13/05/21.
//

import UIKit
class MainButton: UIButton {

    @IBOutlet var contentView: UIView!
    @IBOutlet var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mainButtonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.mainButtonInit()
    }

    private func mainButtonInit()
    {
        Bundle.main.loadNibNamed("MainButton", owner: self, options: nil)
        
        button.layer.cornerRadius = 20
        button.layer.backgroundColor = appColor.mainPurple.cgColor
        button.setTitleColor(.white, for: .normal)

        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        
        
    }
}
