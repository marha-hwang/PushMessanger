//
//  SettingMainViewController.swift
//  PushMessenger
//
//  Created by h2o on 2025/01/17.
//

import Foundation
import UIKit

class NotiSettingViewController: UIViewController {
    
    private var viewModel:NotiSettingViewModel!

    static func create(with viewModel:NotiSettingViewModel) -> NotiSettingViewController {
        let vc = NotiSettingViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Design.commonColor
        
        navigationItem.title = "set_notification_sound".localized()
        
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
