//
//  Button.swift
//  MyMoneeApp
//
//  Created by MacBook on 18/05/21.
//

import UIKit

protocol CustomButtonDelegate {
    func customButtonAction()
}

class CustomButton: UIView {
    
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var mainContent: UIView!
    
    var delegate: CustomButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CustomButton", owner: self, options: nil)
        addSubview(mainContent)
        mainContent.frame = self.bounds
        mainContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    @IBAction func mainButton(_ sender: Any) {
        self.delegate?.customButtonAction()
    }
    
}
