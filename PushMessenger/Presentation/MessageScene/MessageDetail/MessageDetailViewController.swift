//
//  MessageDetailViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import UIKit

class MessageDetailViewController: UIViewController {

    static func create() -> MessageDetailViewController {
        let vc = MessageDetailViewController()
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
