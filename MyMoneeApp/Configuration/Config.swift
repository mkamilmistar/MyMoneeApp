//
//  Auth.swift
//  MyMoneeApp
//
//  Created by MacBook on 15/05/21.
//

import UIKit

struct AuthUser {
    static var data: User = users[0]
}

extension UIViewController {
    
    func createSpinnerView() {
        let child = SpinnerViewController()

        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
}
