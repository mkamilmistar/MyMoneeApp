//
//  NavConfig.swift
//  MyMoneeApp
//
//  Created by MacBook on 16/05/21.
//

import UIKit

func goToMainTabByIndex(_ indexTab: Int) -> UIViewController{
    let mainTabVC = MainTabController(nibName: String(describing: MainTabController.self), bundle: nil)
    
    mainTabVC.modalPresentationStyle = .fullScreen
    mainTabVC.modalTransitionStyle = .crossDissolve
    mainTabVC.selectedIndex = indexTab
    
    return mainTabVC
}
