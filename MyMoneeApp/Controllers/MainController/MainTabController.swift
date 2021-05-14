//
//  MainTabController.swift
//  MyMoneeApp
//
//  Created by MacBook on 11/05/21.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    let selectedColor   = appColor.mainPurple
    let unselectedColor = UIColor(red: 130.0/255.0, green: 130.0/255.0, blue: 130.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = .white
        
        //Tab Bar Home
        let home = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let homeTab = UINavigationController(rootViewController: home)
        homeTab.setNavigationBarHidden(true, animated: false)
        let homeImage = UIImage(named: "Home")?.withRenderingMode(.alwaysOriginal)
        let homeImageSelected = UIImage(named: "Home_Selected")?.withRenderingMode(.alwaysOriginal)
        homeTab.tabBarItem = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeImageSelected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        homeTab.tabBarItem.tag = 0
        
        //Tab Bar Impian
        let impian = DreamViewController(nibName: String(describing: DreamViewController.self), bundle: nil)
        let impianTab = UINavigationController(rootViewController: impian)
        impianTab.setNavigationBarHidden(true, animated: false)
        let impianImage = UIImage(named: "Impian")?.withRenderingMode(.alwaysOriginal)
        let impianImageSelected = UIImage(named: "Impian_Selected")?.withRenderingMode(.alwaysOriginal)
        impianTab.tabBarItem = UITabBarItem(title: "Impian", image: impianImage, selectedImage: impianImageSelected)
        impianTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        impianTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)

        impianTab.tabBarItem.tag = 1
        
        //Tab Bar Profile
        let profile = ProfileViewController(nibName: String(describing: ProfileViewController.self), bundle: nil)
        let profileTab = UINavigationController(rootViewController: profile)
        profileTab.setNavigationBarHidden(true, animated: false)
        let profileImage = UIImage(named: "Profile")?.withRenderingMode(.alwaysOriginal)
        let profileImageSelected = UIImage(named: "Profile_Selected")?.withRenderingMode(.alwaysOriginal)
        profileTab.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, selectedImage: profileImageSelected)
        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        profileTab.tabBarItem.tag = 2
        
        self.viewControllers = [homeTab, impianTab, profileTab]
        
    }

}
