//
//  ViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import UIKit

class MessageListViewController: UIViewController {

    static func create() -> MessageListViewController {
        let vc = MessageListViewController()
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

