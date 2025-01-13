//
//  AppFlowCoordinator.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit
final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(
        navigationController: UINavigationController,
        appDIContainer: AppDIContainer
    ) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let isLogin = false

        if !isLogin{
            moveLogin()
        }
        else {
            moveMain()
        }
    }
    
    private func moveLogin(){
        navigationController.isNavigationBarHidden = true
        
        let loginSceneDIContainer = appDIContainer.makeLoginSceneDIContainer(
            messageFlowCoordinator: appDIContainer.makeMessageSceneDIContainer().makeMessageFlowCoordinator(navigationController: navigationController)
        )
        
        let loginFlow = loginSceneDIContainer.makeLoginFlowCoordinator(navigationController: navigationController)
        loginFlow.start()
    }
    
    private func moveMain(){
        navigationController.isNavigationBarHidden = true
        
        let messageSceneDIContainer = appDIContainer.makeMessageSceneDIContainer()
        let messageFlow = messageSceneDIContainer.makeMessageFlowCoordinator(navigationController: navigationController)
        messageFlow.start()
        
    }
}
