//
//  AppDIContainer.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
final class AppDIContainer{
    func makeLoginSceneDIContainer(messageFlowCoordinator:MessageFlowCoordinator) -> LoginSceneDIContainer {
        LoginSceneDIContainer()
    }
    
    func makeMessageSceneDIContainer() -> MessageSceneDIContainer {
        MessageSceneDIContainer()
    }
}
