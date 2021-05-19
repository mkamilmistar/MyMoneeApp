//
//  ButtonConditional.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

func enabledMainButton(_ button: UIButton) {
    button.layer.cornerRadius = 20
    button.isUserInteractionEnabled = true
    button.isEnabled = true
    button.backgroundColor = UIColor.mainPurple()
    button.setTitleColor(.white, for: .normal)
}

func disabledMainButton(_ button: UIButton) {
    button.layer.cornerRadius = 20
    button.isUserInteractionEnabled = false
    button.isEnabled = false
    button.backgroundColor = UIColor.disabledButton()
    button.setTitleColor(.white, for: .normal)
}

func mainDeleteButton(_ button: UIButton) {
    button.layer.cornerRadius = 20
    button.layer.borderWidth = 3.0
    button.backgroundColor = .none
    button.layer.borderColor = UIColor.mainRed().cgColor
    button.setTitleColor(UIColor.mainRed(), for: .normal)

}

func mainNoBackgroundButton(_ button: UIButton) {
    button.layer.cornerRadius = 20
    button.layer.borderWidth = 3.0
    button.backgroundColor = .none
    button.layer.borderColor = UIColor.mainPurple().cgColor
    button.setTitleColor(UIColor.mainPurple(), for: .normal)
}

func selectBorder(_ object: AnyObject) {
    object.layer.borderColor = UIColor.mainPurple().cgColor
    object.layer.borderWidth = 3.0
    object.layer.cornerRadius = 8.0
}

func deselectBorder(_ object: AnyObject) {
    object.layer.borderWidth = 0
    object.layer.borderColor = UIColor.white.cgColor
}
