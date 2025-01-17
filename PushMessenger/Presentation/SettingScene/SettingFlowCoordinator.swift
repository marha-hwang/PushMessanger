//
//  SettingFlowCoordinator.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

protocol SettingFlowCoordinatorDependencies  {
    func makeSettingMainViewController() -> SettingMainViewController
}

final class SettingFlowCoordinator{
    private weak var mainNavigationController: UINavigationController?
    private let dependencies: SettingFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         dependencies: SettingFlowCoordinatorDependencies) {
        self.mainNavigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let settingNavigationController = UINavigationController() 
        let vc = dependencies.makeSettingMainViewController()
        
        mainNavigationController?.present(settingNavigationController, animated: true)
        settingNavigationController.pushViewController(vc, animated: false)
    }

}
