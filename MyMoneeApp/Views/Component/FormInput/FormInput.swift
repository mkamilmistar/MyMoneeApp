//
//  Form.swift
//  MyMoneeApp
//
//  Created by MacBook on 18/05/21.
//

import Foundation
import UIKit

class FormInput: UIView {
    @IBOutlet var mainContent: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var AmountField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("FormInput", owner: self, options: nil)
        addSubview(mainContent)
        mainContent.frame = self.bounds
        mainContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
