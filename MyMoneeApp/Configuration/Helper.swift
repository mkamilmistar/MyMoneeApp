//
//  Helper.swift
//  MyMoneeApp
//
//  Created by MacBook on 21/05/21.
//

import UIKit

class Helper {
    static func showToast(_ text: String, delay: TimeInterval = 3.0) {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {
            return
        }
        
        let label = UILabel()
        label.backgroundColor = UIColor(white: 0, alpha: 0.5)
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.init(name: "Poppins", size: 15)
        label.alpha = 0
        label.text = text
        label.numberOfLines = 0
        
        var size = label.intrinsicContentSize
        var width = min(size.width, window.frame.width - 30)
        if width != size.width {
            label.textAlignment = .justified
        }
        
        size = label.intrinsicContentSize
        width = min(size.width, window.frame.width - 100)
        
        label.frame = CGRect(x: 20, y: window.frame.height - 150, width: width + 40, height: size.height + 20)
        label.center.x = window.center.x
        label.layer.cornerRadius = min(label.frame.height/2, 25)
        label.layer.masksToBounds = true
        window.addSubview(label)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            label.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: delay, options: .curveEaseOut, animations: {
                label.alpha = 0
            }, completion: {_ in
                label.removeFromSuperview()
            })
        })
    }
}

extension UIViewController {
    
    func setupLoadingView() {
        self.view.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor
                .constraint(equalTo: self.view.centerYAnchor),
            loadingIndicator.widthAnchor
                .constraint(equalToConstant: 50),
            loadingIndicator.heightAnchor
                .constraint(equalTo: loadingIndicator.widthAnchor)
        ])
    }
}

let loadingIndicator: ProgressView = {
    let progress = ProgressView(colors: [UIColor.mainPurple(), .systemBlue, UIColor.mainGrey()], lineWidth: 5)
    progress.translatesAutoresizingMaskIntoConstraints = false
    return progress
}()
