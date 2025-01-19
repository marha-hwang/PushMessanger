//
//  SettingFlowCoordinator.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

protocol SettingFlowCoordinatorDependencies  {
    func makeSettingMainViewController(action:SettingMainViewModelActions) -> SettingMainViewController
    func makeLockSettingViewController(action:LockSettingViewModelActions) -> ScreenLockViewController
    func makeNotiSettingViewController(action:NotiSettingViewModelActions) -> NotiSettingViewController
    func makeAppInfoViewController(action:AppInfoViewModelActions) -> AppInfoViewController
}

final class SettingFlowCoordinator{
    private weak var mainNavigationController: UINavigationController?
    private var settingNavigationController:UINavigationController?
    private let dependencies: SettingFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         dependencies: SettingFlowCoordinatorDependencies) {
        self.mainNavigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        
        settingNavigationController = UINavigationController()
        
        guard let settingNavigationController else {
            return
        }
        
        let actions = SettingMainViewModelActions(showLockSetting: showLockSetting, showNotificationSetting: showNotificationSetting, showAppInfo: showAppInfo)
        let vc = dependencies.makeSettingMainViewController(action: actions)
        
        mainNavigationController?.present(settingNavigationController, animated: true)
        
        settingNavigationController.pushViewController(vc, animated: false)
    }
    
    private func showLockSetting(){
        
        guard let settingNavigationController else {
            return
        }
        
        let vc = dependencies.makeLockSettingViewController(action: LockSettingViewModelActions(showSetPassword: showSetPassword))
        
        settingNavigationController.pushViewController(vc, animated: false)
    }
    
    private func showNotificationSetting(){
        
        guard let settingNavigationController else {
            return
        }
        
        let vc = dependencies.makeNotiSettingViewController(action: NotiSettingViewModelActions(showSetNoti: showSetNoti))
        
        settingNavigationController.pushViewController(vc, animated: false)
    }
    
    private func showAppInfo(){
        
        guard let settingNavigationController else {
            return
        }
        
        let vc = dependencies.makeAppInfoViewController(action: AppInfoViewModelActions(showAppDetail: showAppDetail))

        settingNavigationController.pushViewController(vc, animated: false)
    }
    
    private func showSetPassword(){
        
    }
    
    private func showSetNoti(){
        
    }
    
    private func showAppDetail(){
        
    }
}
