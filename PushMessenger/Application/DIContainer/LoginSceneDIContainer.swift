//
//  LoginSceneDIContainer.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

final class LoginSceneDIContainer:LoginFlowCoordinatorDependencies{
    
    private let messageFlowCoordinator:MessageFlowCoordinator
    
    init(messageFlowCoordinator: MessageFlowCoordinator) {
        self.messageFlowCoordinator = messageFlowCoordinator
    }
    
    func makeLoginViewModel(action:LoginViewModelActions)->LoginViewModel{
        DefaultLoginViewModel(actions: action)
    }
    
    func makeLoginViewController(actions: LoginViewModelActions) -> LoginViewController {
        LoginViewController.create(with: makeLoginViewModel(action: actions))
    }
    
    func makeLockViewController(actions: LockViewModelActions) -> LockViewController {
        LockViewController.create()
    }
    
    func makeLoginFlowCoordinator(navigationController: UINavigationController) -> LoginFlowCoordinator {
        LoginFlowCoordinator(
            navigationController: navigationController,
            messageFlowCoordinator: messageFlowCoordinator,
            dependencies: self
        )
    }
    
    
}
