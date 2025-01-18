//
//  SettingMainViewController.swift
//  PushMessenger
//
//  Created by h2o on 2025/01/17.
//

import Foundation
import UIKit

class SettingMainViewController: UIViewController {
    
    private var viewModel:SettingMainViewModel!

    static func create(with viewModel:SettingMainViewModel) -> SettingMainViewController {
        let vc = SettingMainViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = Design.commonColor
        
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showMainSetting))
        outer.addGestureRecognizer(tapGesture)
    }
    
    @objc func showMainSetting() {
        let vc = ScreenLockViewController.create()
        NSLog("잠금설정이동")
        navigationController?.pushViewController(vc, animated: false)
    }
}
