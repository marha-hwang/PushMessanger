//
//  AppInfoViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/18/25.
//

import Foundation
struct AppInfoViewModelActions{
    let showAppDetail:()->Void
}

protocol AppInfoViewModelInput{
    func showAppDetail()
}

protocol AppInfoViewModelOutput{
    
}

typealias AppInfoViewModel = AppInfoViewModelInput&AppInfoViewModelOutput

final class DefaultAppInfoViewModel:AppInfoViewModel{
    
    private let actions:AppInfoViewModelActions
    
    init(actions: AppInfoViewModelActions) {
        self.actions = actions
    }
    
    func showAppDetail() {
        actions.showAppDetail()
    }
}
