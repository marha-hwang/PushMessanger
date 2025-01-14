//
//  LockViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import Foundation
import UIKit
import SwiftUI

class LockViewController: UIViewController {

    private var viewModel: LockViewModel!
    
    static func create(with viewModel:LockViewModel) -> LockViewController {
        let vc = LockViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        let outerView:UIStackView = {
            let outerView = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .top)
            
            let header:UIStackView = {
                let header = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .bottom)
                
                header.backgroundColor = Design.commonColor

                let title:UILabel = {
                    let title = UILabel()
                    title.translatesAutoresizingMaskIntoConstraints = false
                    title.font = UIFont.systemFont(ofSize: 20)
                    title.textAlignment = .center
                    title.text = "unlock_screen".localized()
                    return title
                }()
                
                header.addArrangedSubview(title)
                
                title.snp.makeConstraints{ make in
                    make.height.equalToSuperview().inset(10)
                }
                
                return header
            }()
            
           // outerView.addArrangedSubview(header)
            
//            header.snp.makeConstraints{ make in
//                make.leading.trailing.equalToSuperview()
//                make.height.equalTo(100)
//                
//            }
            
            return outerView
        }()
        
        view.addSubview(outerView)
        
        outerView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}

struct PreView: PreviewProvider {
    static var previews: some View {
        let messageDI = MessageSceneDIContainer()
        let loginDI = LoginSceneDIContainer(messageFlowCoordinator: messageDI.makeMessageFlowCoordinator(navigationController: UINavigationController()))
        loginDI.makeLockViewController(actions: LockViewModelActions(showMessageList: {})).toPreview()
    }
}
