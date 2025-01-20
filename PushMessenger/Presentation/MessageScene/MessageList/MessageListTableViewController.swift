//
//  MessageListTableViewController.swift
//  PushMessenger
//
//  Created by haram on 1/20/25.
//

import Foundation
import UIKit

class MessageListTableViewController:UITableViewController{
    var viewModel:MessageListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        view.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = .init(top: 0, left: 0, bottom: 100, right: 0)
        
        tableView.register(MessageListItemCell.self, forCellReuseIdentifier: MessageListItemCell.reuseIdentifier)
    
    }
}

extension MessageListTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messageList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageListItemCell.reuseIdentifier, for: indexPath) as? MessageListItemCell else {
            assertionFailure("Cannot dequeue reusable cell \(MessageListItemCell.self) with reuseIdentifier: \(MessageListItemCell.reuseIdentifier)")
            return UITableViewCell()
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetail()
    }
}
