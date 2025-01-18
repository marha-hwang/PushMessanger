//
//  NotiSettingViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/18/25.
//

import Foundation
struct NotiSettingViewModelActions{
    let showSetNoti:()->Void
}

protocol NotiSettingViewModelInput{
    func showSetNoti()
}

protocol NotiSettingViewModelOutput{
    
}

typealias NotiSettingViewModel = NotiSettingViewModelInput&NotiSettingViewModelOutput

final class DefaultNotiSettingViewModel:NotiSettingViewModel{
    
    private let actions:NotiSettingViewModelActions
    
    init(actions: NotiSettingViewModelActions) {
        self.actions = actions
    }
    
    func showSetNoti() {
        actions.showSetNoti()
    }
}
