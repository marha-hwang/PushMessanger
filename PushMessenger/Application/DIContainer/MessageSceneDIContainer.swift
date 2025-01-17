//
//  MessageSceneDIContainer.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

final class MessageSceneDIContainer:MessageFlowCoordinatorDependencies{
    
    func makeMesssageListViewModel(messageType:MessageType, action:MessageListViewModelActions)->MessageListViewModel{
        DefaultMessageListViewModel(messageType: messageType,actions: action)
    }
    
    func makeMessageListViewController(messageType:MessageType, actions: MessageListViewModelActions) -> MessageListViewController {
        MessageListViewController.create(with: makeMesssageListViewModel(messageType: messageType,action: actions))
    }
    
    func makeMessageDetailViewController(message:Message,actions: MessageDetailViewModelActions) -> MessageDetailViewController {
        MessageDetailViewController.create()
    }
    
    func makeMessageFlowCoordinator(navigationController: UINavigationController) -> MessageFlowCoordinator {
        
        let settingDIContainer = SettingSceneDIContainer()
        let settingCoordinator = settingDIContainer.makeSettingFlowCoordinator(navigationController: navigationController)
        
        return MessageFlowCoordinator(
            navigationController: navigationController,
            settingFlowCoordinator: settingCoordinator,
            dependencies: self
        )
    }
    
    
}
