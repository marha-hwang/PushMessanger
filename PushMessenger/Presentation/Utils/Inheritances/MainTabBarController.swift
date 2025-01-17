//
//  CustomTabBarController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

class MainTabBarController:UITabBarController{
    override func viewDidLoad() {
        self.delegate = self
        navigationItem.hidesBackButton = true
        tabBar.backgroundColor = UIColor(hex: "e1e9f0", alpha: 1.0)
        tabBar.tintColor = .black
        
    }
}

extension MainTabBarController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // 현재 선택된 탭의 인덱스를 가져옵니다
        let selectedIndex = tabBarController.selectedIndex
        
        if selectedIndex == 0 { navigationItem.title = "notice_notification".localized() }
        else if selectedIndex == 1 { navigationItem.title = "emergency_notification".localized() }
    }
}
