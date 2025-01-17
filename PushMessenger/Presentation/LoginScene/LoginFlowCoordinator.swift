//
//  LoginSceneDIContainer.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

protocol LoginFlowCoordinatorDependencies  {
    func makeLoginViewController(actions: LoginViewModelActions) -> LoginViewController
    func makeLockViewController(actions: LockViewModelActions) -> LockViewController
}

final class LoginFlowCoordinator{
    private weak var navigationController: UINavigationController?
    private let messageFlowCoordinator:MessageFlowCoordinator
    private let dependencies: LoginFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         messageFlowCoordinator:MessageFlowCoordinator,
         dependencies: LoginFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.messageFlowCoordinator = messageFlowCoordinator
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = LoginViewModelActions(showMessageList:showMessageList, showLock: showLock)
        let vc = dependencies.makeLoginViewController(actions: actions)
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func showLock()->Void{
        let actions = LockViewModelActions(showMessageList: showMessageList)
        
        let vc = dependencies.makeLockViewController(actions: actions)
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func showMessageList()->Void{
        /* 
         다른 coordinator로 자연스럽게 넘어가는 법은?
         하위 코디네이터를 상위코디네이터에서 생성자 인자로 받아서 활용하는 것이 좋을 것 같음
         */
        messageFlowCoordinator.start()
    }

}
