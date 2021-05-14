//
//  Shadow.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

func setShadow(_ view: UIView) {
    view.layer.cornerRadius = 8.0
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.3
    view.layer.shadowOffset = CGSize(width: 0, height: 2)
}

