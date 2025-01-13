//
//  MessageFlowCoordinator.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

protocol MessageFlowCoordinatorDependencies  {
    func makeMessageListViewController(actions: MessageListViewModelActions) -> MessageListViewController
    func makeMessageDetailViewController(actions: MessageDetailViewModelActions) -> MessageDetailViewController
}

final class MessageFlowCoordinator{
    private weak var navigationController: UINavigationController?
    private let dependencies: MessageFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         dependencies: MessageFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let noticeNav = UINavigationController()
        let EmergencyNav = UINavigationController()
        
        let tabbar = CustomTabBarController()
        tabbar.setViewControllers([noticeNav, EmergencyNav], animated: false)
        noticeNav.tabBarItem = UITabBarItem(title: "Notice", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        EmergencyNav.tabBarItem = UITabBarItem(title: "Emergency", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
                
        let actions = MessageListViewModelActions(showMessageDetail: showMessageDetail)
        let noticeVC = dependencies.makeMessageListViewController(actions: actions)
        let emergencyVC = dependencies.makeMessageListViewController(actions: actions)
        noticeNav.pushViewController(noticeVC, animated: false)
        EmergencyNav.pushViewController(emergencyVC, animated: false)
        
        navigationController?.pushViewController(tabbar, animated: false)
    }
    
    func showMessageDetail()->Void{
        let actions = MessageDetailViewModelActions()
        
        let vc = dependencies.makeMessageDetailViewController(actions: actions)
        
        navigationController?.pushViewController(vc, animated: false)
    }
}
