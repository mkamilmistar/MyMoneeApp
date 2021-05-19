//
//  AnotherButton.swift
//  MyMoneeApp
//
//  Created by MacBook on 18/05/21.
//

import Foundation
import UIKit

protocol AnotherButtonDelegate: AnyObject {
    func firstBtnAction()
    func secondBtnAction()
}

class AnotherButton: UIView {
    @IBOutlet var mainContent: UIView!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    
    weak var delegate: AnotherButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("AnotherButton", owner: self, options: nil)
        addSubview(mainContent)
        mainContent.frame = self.bounds
        mainContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    @IBAction func secondButton(_ sender: Any) {
        self.delegate?.secondBtnAction()
    }
    
    @IBAction func firstButton(_ sender: Any) {
        self.delegate?.firstBtnAction()
    }
}
