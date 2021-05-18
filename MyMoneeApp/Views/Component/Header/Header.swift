//
//  NotFound.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

protocol HeaderDelegate {
    func headerButtonAction()
    
}

class Header: UIView {

    @IBOutlet var mainContent: UIView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var headerLabel: UILabel!
    
    var delegate: HeaderDelegate?
    
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
        Bundle.main.loadNibNamed("Header", owner: self, options: nil)
        addSubview(mainContent)
        mainContent.frame = self.bounds
        mainContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        self.delegate?.headerButtonAction()
        
    }
    
}
