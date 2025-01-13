//
//  CustomTabBarController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

class CustomTabBarController:UITabBarController{
    override func viewDidLoad() {
        tabBar.backgroundColor = UIColor(hex: "e1e9f0", alpha: 1.0)
        tabBar.tintColor = .black
    }
}
