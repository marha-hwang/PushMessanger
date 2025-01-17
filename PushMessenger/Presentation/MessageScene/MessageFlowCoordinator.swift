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
    func makeMessageDetailViewController(message:Message, actions: MessageDetailViewModelActions) -> MessageDetailViewController
}

enum MessageType{
    case notice
    case emergency
}

final class MessageFlowCoordinator{
    private weak var navigationController: UINavigationController?
    
    private let tabbar = MainTabBarController()
    
    private let dependencies: MessageFlowCoordinatorDependencies
    private let settingFlowCoordinator:SettingFlowCoordinator

    init(navigationController: UINavigationController,
         settingFlowCoordinator:SettingFlowCoordinator,
         dependencies: MessageFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.settingFlowCoordinator = settingFlowCoordinator
        self.dependencies = dependencies
    }
    
    func start() {
        
        let actions = MessageListViewModelActions(showMessageDetail: showMessageDetail(message:))
        let noticeVC = dependencies.makeMessageListViewController(messageType: .notice ,actions: actions)
        let emergencyVC = dependencies.makeMessageListViewController(messageType: .emergency,actions: actions)

        tabbar.setViewControllers([noticeVC, emergencyVC], animated: false)
        noticeVC.tabBarItem = UITabBarItem(title: "Notice", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        emergencyVC.tabBarItem = UITabBarItem(title: "Emergency", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark.fill"))
        
        navigationController?.pushViewController(tabbar, animated: false)
        setupNavigation()
    }
    
    func showMessageDetail(message:Message)->Void{
        
        let actions = MessageDetailViewModelActions()
        let vc = dependencies.makeMessageDetailViewController(message:message, actions: actions)
                
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func showMainSetting() {
        settingFlowCoordinator.start()
    }
    
    private func setupNavigation(){
        //초기 타이틀 설정
        tabbar.navigationItem.title = "notice_notification".localized()
        
        
        //설정버튼 추가
        let imageView:UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "gearshape")
            imageView.contentMode = UIView.ContentMode.scaleToFill
            imageView.tintColor = .white
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showMainSetting))
            imageView.addGestureRecognizer(tapGesture)
            
            return imageView
        }()
        
        tabbar.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: imageView)
        
        imageView.snp.makeConstraints{
            $0.width.height.equalTo(25)
        }
        
        /* 
         뒤로가기 버튼 커스텀
         
         backIndicatorImage는 뒤로 가기 버튼의 아이콘을 커스터마이즈하는 데 사용됨.
         backIndicatorImage와 backIndicatorTransitionMaskImage는 보통 같은 이미지를 사용하며, 하나는 보여지는 아이콘, 다른 하나는 애니메이션 전환에 사용됨.
         뒤로가기 커스텀은 해당 화면의 이전 화면에서 커스텀을 해야 한다.
         */
        
        /* pushVeiwController을 하기전에 아래 코드를 호출하면 tabbar에 navigationController이 들어가있지 않기 때문에 동작 하지 않음*/
        tabbar.navigationController?.navigationBar.backIndicatorImage = UIImage()
        tabbar.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
//        navigationController?.navigationBar.backIndicatorImage = UIImage()
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        
        let image = UIImage(systemName: "arrowshape.backward.fill")
        
        let backButton = UIBarButtonItem()
        backButton.image = image
        backButton.tintColor = .white
        tabbar.navigationItem.backBarButtonItem = backButton
    }

}
