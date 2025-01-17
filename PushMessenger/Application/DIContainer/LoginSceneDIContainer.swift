//
//  LoginSceneDIContainer.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

final class LoginSceneDIContainer:LoginFlowCoordinatorDependencies{
    
    func makeLoginViewModel(action:LoginViewModelActions)->LoginViewModel{
        DefaultLoginViewModel(actions: action)
    }
    
    func makeLockViewModel(action:LockViewModelActions)->LockViewModel{
        DefaultLockViewModel(actions: action)
    }
    
    func makeLoginViewController(actions: LoginViewModelActions) -> LoginViewController {
        LoginViewController.create(with: makeLoginViewModel(action: actions))
    }
    
    func makeLockViewController(actions: LockViewModelActions) -> LockViewController {
        LockViewController.create(with: makeLockViewModel(action: actions))
    }
    
    func makeLoginFlowCoordinator(navigationController: UINavigationController) -> LoginFlowCoordinator {
        
        let messageDIContainer = MessageSceneDIContainer()
        let messageFlowCoordinator = messageDIContainer.makeMessageFlowCoordinator(navigationController: navigationController)
        
        return LoginFlowCoordinator(
            navigationController: navigationController,
            messageFlowCoordinator: messageFlowCoordinator,
            dependencies: self
        )
    }
    
    
}
