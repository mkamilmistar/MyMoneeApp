//
//  ButtonConditional.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

func enabledMainButton(_ button: UIButton) {
    button.isUserInteractionEnabled = true
    button.isEnabled = true
    button.backgroundColor = appColor.mainPurple
}

func disabledMainButton(_ button: UIButton) {
    button.isUserInteractionEnabled = false
    button.isEnabled = false
    button.backgroundColor = appColor.disabledButton
}

func mainDeleteButton(_ button: UIButton) {
    button.layer.cornerRadius = 20
    button.layer.borderWidth = 3.0
    button.layer.borderColor = appColor.mainRed.cgColor
}

func mainNoBackgroundButton(_ button: UIButton) {
    button.layer.cornerRadius = 20
    button.layer.borderWidth = 3.0
    button.layer.borderColor = appColor.mainPurple.cgColor
}
