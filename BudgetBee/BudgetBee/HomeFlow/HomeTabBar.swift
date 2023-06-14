//
//  HomeTabBar.swift
//  BudgetBee
//
//  Created by Ahmed Hesham on 18/05/2023.
//

import Foundation
import UIKit

class HomeTabbarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let item1 = OverviewViewController()
        let item2 = HomeViewController()
        let item3 = UIViewController()
        let item4 = UIViewController()
  
        let icon1 = UITabBarItem(title: "", image: UIImage(named: "ic_calendar")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_calendar")?.withRenderingMode(.alwaysOriginal))
        let icon2 = UITabBarItem(title: "", image: UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_home")?.withRenderingMode(.alwaysOriginal))
        let icon3 = UITabBarItem(title: "", image: UIImage(named: "ic_calculator")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_calculator")?.withRenderingMode(.alwaysOriginal))
        let icon4 = UITabBarItem(title: "", image: UIImage(named: "ic_settings")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "ic_settings")?.withRenderingMode(.alwaysOriginal))

        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
        item3.tabBarItem = icon3
        item4.tabBarItem = icon4
        let controllers = [item1 , item2 , item3 , item4]
        self.viewControllers = controllers
    }
    
    func setupTabBar() {
        tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        tabBar.layer.shadowRadius = 0.1
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.masksToBounds = false
    }

}

extension HomeTabbarViewController {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}
