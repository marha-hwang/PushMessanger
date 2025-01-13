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
}

protocol LockViewModelOutput{
}

typealias LockViewModel = LockViewModelInput&LockViewModelOutput

final class DefaultLockViewModel:LockViewModel{
}
