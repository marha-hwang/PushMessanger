//
//  ScreenLockViewController.swift
//  PushMessenger
//
//  Created by h2o on 2025/01/17.
//

import Foundation
import UIKit

class ScreenLockViewController: UIViewController {

    static func create() -> ScreenLockViewController {
            let vc = ScreenLockViewController()
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = Design.commonColor
        
        let outer:UIStackView = {
            let outer = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .center)
            
            outer.backgroundColor = .red
            
            return outer
        }()
        
        view.addSubview(outer)
        
        outer.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}
