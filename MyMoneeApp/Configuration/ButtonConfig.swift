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
    button.backgroundColor = AppColor.mainPurple
}

func disabledMainButton(_ button: UIButton) {
    button.isUserInteractionEnabled = false
    button.isEnabled = false
    button.backgroundColor = AppColor.disabledButton
}

func mainDeleteButton(_ button: UIButton) {
    button.layer.cornerRadius = 20
    button.layer.borderWidth = 3.0
    button.layer.borderColor = AppColor.mainRed.cgColor
}

func mainNoBackgroundButton(_ button: UIButton) {
    button.layer.cornerRadius = 20
    button.layer.borderWidth = 3.0
    button.layer.borderColor = AppColor.mainPurple.cgColor
}
