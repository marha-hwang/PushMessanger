//
//  SettingSceneDIContainer.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

final class SettingSceneDIContainer:SettingFlowCoordinatorDependencies{
    
    func makeSettingMainViewController() -> SettingMainViewController {
        SettingMainViewController.create()
    }
    
    func makeSettingFlowCoordinator(navigationController: UINavigationController) -> SettingFlowCoordinator {
        SettingFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
    
    
}
