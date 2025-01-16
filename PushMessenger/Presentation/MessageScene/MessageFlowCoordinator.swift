//
//  MessageFlowCoordinator.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

protocol MessageFlowCoordinatorDependencies  {
    func makeMessageListViewController(messageType:MessageType, actions: MessageListViewModelActions) -> MessageListViewController
    func makeMessageDetailViewController(actions: MessageDetailViewModelActions) -> MessageDetailViewController
}

enum MessageType{
    case notice
    case emergency
}

final class MessageFlowCoordinator{
    private weak var navigationController: UINavigationController?
    private var noticeNav: UINavigationController = UINavigationController()
    private var EmergencyNav: UINavigationController = UINavigationController()
    private let tabbar = CustomTabBarController()
    
    private let dependencies: MessageFlowCoordinatorDependencies

    init(navigationController: UINavigationController,
         dependencies: MessageFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        
        tabbar.setViewControllers([noticeNav, EmergencyNav], animated: false)
        noticeNav.tabBarItem = UITabBarItem(title: "Notice", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        EmergencyNav.tabBarItem = UITabBarItem(title: "Emergency", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
                
        let actions = MessageListViewModelActions(showMessageDetail: showMessageDetail(messageType:))
        let noticeVC = dependencies.makeMessageListViewController(messageType: .notice ,actions: actions)
        let emergencyVC = dependencies.makeMessageListViewController(messageType: .emergency,actions: actions)
        noticeNav.pushViewController(noticeVC, animated: false)
        EmergencyNav.pushViewController(emergencyVC, animated: false)
        
        navigationController?.pushViewController(tabbar, animated: false)
    }
    
    func showMessageDetail(messageType:MessageType)->Void{
        let actions = MessageDetailViewModelActions()
        
        let vc = dependencies.makeMessageDetailViewController(actions: actions)
        tabbar.tabBar.isHidden = true
        
        if messageType == .notice{
            noticeNav.pushViewController(vc, animated: false)    
        }
        else if messageType == .emergency{
            EmergencyNav.pushViewController(vc, animated: false)
        }
    }
}
