//
//  SettingSceneDIContainer.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

final class SettingSceneDIContainer:SettingFlowCoordinatorDependencies{
    
    //MARK: ViewModel
    func makeAppInfoViewModel(actions:AppInfoViewModelActions)->AppInfoViewModel{
        DefaultAppInfoViewModel(actions: actions)
    }
    
    func makeNotiSettingViewModel(actions:NotiSettingViewModelActions)->NotiSettingViewModel{
        DefaultNotiSettingViewModel(actions: actions)
    }
    
    func makeScreenLockViewModel(actions:LockSettingViewModelActions)->LockSettingViewModel{
        DefaultLockSettingViewModel(actions: actions)
    }
    
    func makeSettingMainViewModel(actions:SettingMainViewModelActions)->SettingMainViewModel{
        DefaultSettingMainViewModel(actions: actions)
    }
    
    //MARK: ViewController
    func makeSettingMainViewController(action: SettingMainViewModelActions) -> SettingMainViewController {
        SettingMainViewController.create(with: makeSettingMainViewModel(actions: action))
    }
    
    func makeLockSettingViewController(action: LockSettingViewModelActions) -> ScreenLockViewController {
        ScreenLockViewController.create(with: makeScreenLockViewModel(actions: action))
    }
    
    func makeNotiSettingViewController(action: NotiSettingViewModelActions) -> NotiSettingViewController {
        NotiSettingViewController.create(with: makeNotiSettingViewModel(actions: action))
    }
    
    func makeAppInfoViewController(action: AppInfoViewModelActions) -> AppInfoViewController {
        AppInfoViewController.create(with: makeAppInfoViewModel(actions: action))
    }
    
    //MARK: Coordinator
    func makeSettingFlowCoordinator(navigationController: UINavigationController) -> SettingFlowCoordinator {
        SettingFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
    
    
}
