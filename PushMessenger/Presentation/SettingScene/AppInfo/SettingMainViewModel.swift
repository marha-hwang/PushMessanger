//
//  SettingMainViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/18/25.
//

import Foundation
struct SettingMainViewModelActions{
    let showLockSetting:()->Void
    let showNotificationSetting:()->Void
    let showAppInfo:()->Void
}

protocol SettingMainViewModelInput{
    func showLockSetting()
    func showNotificationSetting()
    func showAppInfo()
}

protocol SettingMainViewModelOutput{
    
}

typealias SettingMainViewModel = SettingMainViewModelInput&SettingMainViewModelOutput

final class DefaultSettingMainViewModel:SettingMainViewModel{
    
    private let actions:SettingMainViewModelActions
    
    init(actions: SettingMainViewModelActions) {
        self.actions = actions
    }
    
    func showLockSetting() {
        actions.showLockSetting()
    }
    
    func showNotificationSetting() {
        actions.showNotificationSetting()
    }
    
    func showAppInfo() {
        actions.showAppInfo()
    }
}
