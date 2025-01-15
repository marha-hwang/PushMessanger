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
        
//        navigationItem.hidesBackButton = true  
        navigationItem.title = "notice_notification".localized()
        
        view.backgroundColor = Design.commonColor
        
        let temp = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .bottom)
        temp.backgroundColor = .white
        
        view.addSubview(temp)
        
        temp.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissKeyboard() {
        viewModel.showDetail()
    }
}

