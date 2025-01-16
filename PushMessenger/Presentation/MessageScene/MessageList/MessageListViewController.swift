//
//  ViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import UIKit

class MessageListViewController: UIViewController {

    private var viewModel: MessageListViewModel!
    
    static func create(with viewModel:MessageListViewModel) -> MessageListViewController {
        let vc = MessageListViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if viewModel.messageType == .notice{
            navigationItem.title = "notice_notification".localized()   
        }
        else if viewModel.messageType == .emergency{
            navigationItem.title = "emergency_notification".localized()
        }
        
        view.backgroundColor = Design.commonColor
        
        let temp = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .bottom)
        temp.backgroundColor = .white
        
        view.addSubview(temp)
        
        temp.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        
        //네비게이션 관련 임시코드
//        let image = UIImage(systemName: "arrowshape.backward.fill")
//        image?.withTintColor(.black)
//        navi.backIndicatorImage = UIImage()
//        navigationBar.backIndicatorTransitionMaskImage = UIImage()
//        
//        let backButton = UIBarButtonItem()
//        backButton.image = image
//        backButton.tintColor = .black
//        navigationItem.backBarButtonItem = backButton
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc func dismissKeyboard() {
        viewModel.showDetail()
    }
}

