//
//  LockViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit

class LockViewController: UIViewController {

    static func create() -> LockViewController {
        let vc = LockViewController()
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
