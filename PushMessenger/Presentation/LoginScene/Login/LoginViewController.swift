//
//  LoginViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import UIKit

class LoginViewController: UIViewController {
    private var viewModel: LoginViewModel!
    
    static func create(with viewModel: LoginViewModel) -> LoginViewController {
        let vc = LoginViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        let outerView:UIStackView = {
            let outerView = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .center)
            outerView.backgroundColor = .green
            return outerView
        }()
        
        view.addSubview(outerView)
        outerView.snp.makeConstraints{ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginEvent))
        outerView.isUserInteractionEnabled = true
        outerView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func loginEvent(sender: UITapGestureRecognizer){
        viewModel.confirmLogin(id: "aa", password: "bbb", phoneNumber: "ccc")
    }

}
