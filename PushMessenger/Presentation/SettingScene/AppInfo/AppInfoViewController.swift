//
//  AppInfoViewController.swift
//  PushMessenger
//
//  Created by haram on 1/18/25.
//

import Foundation
import UIKit

class AppInfoViewController: UIViewController {
    
    private var viewModel:AppInfoViewModel!

    static func create(with viewModel:AppInfoViewModel) -> AppInfoViewController {
        let vc = AppInfoViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Design.commonColor
        
        navigationItem.title = "app_info".localized()
        
        let outer:UIStackView = {
            let outer = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .center)
            
            outer.backgroundColor = .blue
            
            return outer
        }()
        
        view.addSubview(outer)
        
        outer.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}
