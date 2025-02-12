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
        
        setupNavigationItem()
        
        view.backgroundColor = Design.commonColor
        
        let outer:UIStackView = {
            let outer = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .center)
            
            outer.backgroundColor = .yellow
            
            return outer
        }()
        
        view.addSubview(outer)
        
        outer.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationItem(){
        
    }
}
