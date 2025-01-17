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
    lazy var passwordField:UITextField = {
        let passwordField = UITextField()
        
        passwordField.delegate = self
        
        passwordField.isHidden = true
        passwordField.keyboardType = .numberPad
        passwordField.becomeFirstResponder()
        
        return passwordField
    }()
    
    static func create(with viewModel:LockViewModel) -> LockViewController {
        let vc = LockViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Design.commonColor
        navigationItem.title = "unlock_screen".localized()
        navigationItem.hidesBackButton = true
        
        view.addSubview(passwordField)
        
        setupViews()
    }
    
    lazy var lock1 = LockImageView()
    lazy var lock2 = LockImageView()
    lazy var lock3 = LockImageView()
    lazy var lock4 = LockImageView()
    
    
    private func setupViews(){
        let outerView:UIStackView = {
            let outerView = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .center)
            outerView.backgroundColor = .white
            
            let description:UILabel = {
                let description = UILabel()
                description.text = "lock_description".localized()
                description.textAlignment = .center
                
                return description
            }()
            
            let inputView:UIStackView = {
                let inputView = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .top)
                
                lock1.ininLockImageView()
                lock2.ininLockImageView()
                lock3.ininLockImageView()
                lock4.ininLockImageView()
                
                inputView.addArrangedSubview(lock1)
                inputView.addArrangedSubview(lock2)
                inputView.addArrangedSubview(lock3)
                inputView.addArrangedSubview(lock4)
                
                lock1.snp.makeConstraints{
                    $0.width.equalTo(60)
                    $0.height.equalTo(60)
                }
                
                lock2.snp.makeConstraints{
                    $0.width.equalTo(60)
                    $0.height.equalTo(60)
                }
                
                lock3.snp.makeConstraints{
                    $0.width.equalTo(60)
                    $0.height.equalTo(60)
                }
                
                lock4.snp.makeConstraints{
                    $0.width.equalTo(60)
                    $0.height.equalTo(60)
                }
                
                
                return inputView
            }()
            
            outerView.addArrangedSubview(description)
            outerView.addArrangedSubview(inputView)
            
            description.snp.makeConstraints{ make in
                make.width.equalToSuperview()
                make.height.equalTo(80)
            }
            
            inputView.snp.makeConstraints{ make in
                make.leading.equalToSuperview().inset(30)
                make.trailing.equalToSuperview().inset(30)
                make.top.equalTo(description.snp.bottom)
            }
            
            return outerView
        }()
        
        view.addSubview(outerView)
        
        outerView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

extension LockViewController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newText = (textField.text as? NSString ?? "").replacingCharacters(in: range, with: string)
        print(newText)
        /* 텍스트 개수에 따른 이미지 색상 변경*/
        if newText.count > 3 {
            lock1.tintColor = Design.commonColor
            lock2.tintColor = Design.commonColor
            lock3.tintColor = Design.commonColor
            lock4.tintColor = Design.commonColor
            textField.text = newText.getString(0, 4)
            
            /* 비밀번호 검증*/
            let isCorrect = self.viewModel.isCorrectPassword(input: newText.getString(0, 4))
            if !isCorrect {
                
                textField.text = ""
                
                /* 비밀번호 틀렸다는 알림 필요*/
                
                
                lock1.tintColor = .lightGray
                lock2.tintColor = .lightGray
                lock3.tintColor = .lightGray
                lock4.tintColor = .lightGray
                
            }
            
            return false
        }
        else if newText.count > 2{
            lock1.tintColor = Design.commonColor
            lock2.tintColor = Design.commonColor
            lock3.tintColor = Design.commonColor
            lock4.tintColor = .lightGray
        }
        else if newText.count > 1{
            lock1.tintColor = Design.commonColor
            lock2.tintColor = Design.commonColor
            lock3.tintColor = .lightGray
            lock4.tintColor = .lightGray
        }
        else if newText.count > 0{
            lock1.tintColor = Design.commonColor
            lock2.tintColor = .lightGray
            lock3.tintColor = .lightGray
            lock4.tintColor = .lightGray
        }
        else {
            lock1.tintColor = .lightGray
            lock2.tintColor = .lightGray
            lock3.tintColor = .lightGray
            lock4.tintColor = .lightGray
        }
        
        return true  // 텍스트를 변경할 수 있도록 허용
    }
}

class LockImageView:UIImageView{
    
    func ininLockImageView(){
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleToFill
        tintColor = .gray
        image = UIImage(systemName: "lock.circle.fill")
    }
}
