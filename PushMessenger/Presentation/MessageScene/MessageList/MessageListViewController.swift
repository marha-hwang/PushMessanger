//
//  ViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import UIKit
  
class MessageListViewController: UIViewController {

    private var viewModel: MessageListViewModel!
    let messageListTableViewController = MessageListTableViewController()
    
    static func create(with viewModel:MessageListViewModel) -> MessageListViewController {
        let vc = MessageListViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Design.commonColor
        
        setupViews()
        prepareSubViewController()
    }
    
    private func setupViews(){
        let messageListContainer:UIView = {
            let messageListContainer = UIView()
            messageListContainer.translatesAutoresizingMaskIntoConstraints = false
            messageListContainer.backgroundColor = .white
            
            messageListContainer.addSubview(messageListTableViewController.tableView)
            
            messageListTableViewController.tableView.snp.makeConstraints{
                $0.top.bottom.leading.trailing.equalToSuperview()
            }
            
            return messageListContainer
        }()
        
        view.addSubview(messageListContainer)
        
        messageListContainer.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func prepareSubViewController(){
        addChild(messageListTableViewController)
        messageListTableViewController.viewModel = viewModel
    }
}

