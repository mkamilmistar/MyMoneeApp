//
//  NavigationBar.swift
//  MyMoneeApp
//
//  Created by MacBook on 19/05/21.
//

import UIKit
protocol NavigationBarDelegate: AnyObject {
    func backBtnAction()
}

class NavigationBar: UIView {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var navigationLabel: UILabel!
    
    weak var delegate: NavigationBarDelegate?
    
    // Constructor dengan programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    // consturctor dengan interface builder (storyBoard)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        addSubview(mainView)
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func backButton(_ sender: UITapGestureRecognizer) {
        self.delegate?.backBtnAction()
    }
}
