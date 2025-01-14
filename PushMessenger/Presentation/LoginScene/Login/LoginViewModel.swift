//
//  LoginViewModel.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
struct LoginViewModelActions{
    let showMessageList:()->Void
    let showLock:()->Void
}

protocol LoginViewModelInput{
    func confirmLogin(id:String, password:String, phoneNumber:String)
}

protocol LoginViewModelOutput{
}

typealias LoginViewModel = LoginViewModelInput&LoginViewModelOutput

final class DefaultLoginViewModel:LoginViewModel{
    
    private let actions:LoginViewModelActions?
    
    init(actions: LoginViewModelActions?) {
        self.actions = actions
    }
    
    func confirmLogin(id: String, password: String, phoneNumber: String) {
        //2차비밀번호 여부 확인하여 잠금화면 or 메인화면으로 이동
        
      //  actions?.showMessageList()
    }
}
