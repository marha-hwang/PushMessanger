//
//  MessageSceneDIContainer.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

final class MessageSceneDIContainer:MessageFlowCoordinatorDependencies{
    
    func makeMesssageListViewModel(action:MessageListViewModelActions)->MessageListViewModel{
        DefaultMessageListViewModel(actions: action)
    }
    
    func makeMessageListViewController(actions: MessageListViewModelActions) -> MessageListViewController {
        MessageListViewController.create(with: makeMesssageListViewModel(action: actions))
    }
    
    func makeMessageDetailViewController(actions: MessageDetailViewModelActions) -> MessageDetailViewController {
        MessageDetailViewController.create()
    }
    
    func makeMessageFlowCoordinator(navigationController: UINavigationController) -> MessageFlowCoordinator {
        MessageFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
    
    
}
