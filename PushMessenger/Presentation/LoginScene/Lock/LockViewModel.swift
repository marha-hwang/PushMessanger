//
//  LoginViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
struct LockViewModelActions{
    let showMessageList:()->Void
}

protocol LockViewModelInput{
    func isCorrectPassword(input:String)->Bool
}

protocol LockViewModelOutput{
}

typealias LockViewModel = LockViewModelInput&LockViewModelOutput

final class DefaultLockViewModel:LockViewModel{
    
    private let actions:LockViewModelActions
    
    init(actions: LockViewModelActions) {
        self.actions = actions
    }
    
    func isCorrectPassword(input: String)->Bool {
        let password = "0000"
        
        if input == password{
            actions.showMessageList()
            return true
        }
        else {
            return false
        }
    }
}
