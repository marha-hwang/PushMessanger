//
//  LockSettingViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/18/25.
//

import Foundation
struct LockSettingViewModelActions{
    let showSetPassword:()->Void
}

protocol LockSettingViewModelInput{
    func showSetPassword()
}

protocol LockSettingViewModelOutput{
    
}

typealias LockSettingViewModel = LockSettingViewModelInput&LockSettingViewModelOutput

final class DefaultLockSettingViewModel:LockSettingViewModel{
    
    private let actions:LockSettingViewModelActions
    
    init(actions: LockSettingViewModelActions) {
        self.actions = actions
    }
    
    func showSetPassword() {
        actions.showSetPassword()
    }
}
