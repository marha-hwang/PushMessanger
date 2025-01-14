//
//  LoginViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import UIKit
import SnapKit

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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func loginEvent(sender: UITapGestureRecognizer){
        viewModel.confirmLogin(id: "aa", password: "bbb", phoneNumber: "ccc")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // 키보드 숨기기
    }
    
    private lazy var idTextField:LoginFieldTextView = {
        let loginTextView = LoginFieldTextView()
        loginTextView.initLoginFieldTextView(image: "person.fill", placeHolder: "id".localized())
        return loginTextView 
    }()
    
    private lazy var passwordTextField:LoginFieldTextView = {
        let loginTextView = LoginFieldTextView()
        loginTextView.initLoginFieldTextView(image: "lock.fill", placeHolder: "password".localized())
        return loginTextView 
    }()
    
    private lazy var phoneNumberTextField:LoginFieldTextView = {
        let loginTextView = LoginFieldTextView()
        loginTextView.initLoginFieldTextView(image: "phone.fill", placeHolder: "phone_number".localized())
        return loginTextView 
    }()
    
    private func setupViews(){
        view.backgroundColor = Design.commonColor
        let outerView:UIStackView = {
            let outerView = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .center)
            
            let logoImageView:UIImageView = {
                let logoImageView = UIImageView()
                logoImageView.translatesAutoresizingMaskIntoConstraints = false
                logoImageView.contentMode = .scaleToFill
                
                logoImageView.image = UIImage(named: "logo")
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                logoImageView.isUserInteractionEnabled = true
                logoImageView.addGestureRecognizer(tapGesture)
                return logoImageView
            }()
            
            let inputView:UIStackView = {
                let inputView = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .center)
                inputView.backgroundColor = .white
                
                inputView.addArrangedSubview(idTextField)
                inputView.addArrangedSubview(passwordTextField)
                inputView.addArrangedSubview(phoneNumberTextField)
                
                idTextField.snp.makeConstraints{ make in
                    make.height.equalTo(50)
                    make.width.equalTo(inputView.snp.width).inset(20)                   
                }
                
                passwordTextField.snp.makeConstraints{ make in
                    make.height.equalTo(50)
                    make.width.equalTo(inputView.snp.width).inset(20)                  
                }
                
                phoneNumberTextField.snp.makeConstraints{ make in
                    make.height.equalTo(50)
                    make.width.equalTo(inputView.snp.width).inset(20)
                }
                
                return inputView
            }()
            
            let loginBtn:UIStackView = {
                let loginBtn = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .center)
                loginBtn.backgroundColor = .yellow
                
                let text:UILabel = {
                    let text = UILabel()
                    text.translatesAutoresizingMaskIntoConstraints = false
                    text.font = UIFont.systemFont(ofSize: 24)
                    text.text = "login".localized()
                    text.textAlignment = .center
                    return text
                }()
                
                loginBtn.addArrangedSubview(text)
                
                return loginBtn
            }()
            
            outerView.addArrangedSubview(logoImageView)
            outerView.addArrangedSubview(inputView)
            outerView.addArrangedSubview(loginBtn)

            logoImageView.snp.makeConstraints{ make in
                make.width.equalTo(270)
                make.height.equalTo(250)
            }
            
            inputView.snp.makeConstraints{ make in
                make.top.equalTo(logoImageView.snp.bottom).offset(50)
                make.width.equalToSuperview()
            }
            
            loginBtn.snp.makeConstraints{ make in
                make.top.equalTo(inputView.snp.bottom).offset(50)
                make.width.equalToSuperview()
                make.height.equalTo(60)
            }
            
            return outerView
        }()
        
        view.addSubview(outerView)
        
        outerView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginEvent))
        outerView.isUserInteractionEnabled = true
        outerView.addGestureRecognizer(gestureRecognizer)
    }

}

class LoginFieldTextView:UIStackView{
        
    private lazy var loginTextField:UITextField = {
        let loginTextView = UITextField()
        loginTextView.delegate = self
        loginTextView.translatesAutoresizingMaskIntoConstraints = false
        loginTextView.textAlignment = .left
        return loginTextView 
    }()
    
    private lazy var deleteImageView:UIImageView = {
        let deleteImageView = UIImageView()
        deleteImageView.translatesAutoresizingMaskIntoConstraints = false
        deleteImageView.contentMode = .scaleAspectFit
        deleteImageView.tintColor = .gray
        deleteImageView.alpha = 0.5

        deleteImageView.image = UIImage(systemName: "xmark.circle.fill")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(deleteText))
        deleteImageView.addGestureRecognizer(tapGesture)
        deleteImageView.isUserInteractionEnabled = true
        deleteImageView.isHidden = true
        
        return deleteImageView
    }()
    
    @objc func deleteText() {
        loginTextField.text = ""
    }
    
    func initLoginFieldTextView(image:String, placeHolder:String){
        
        let loginField:UIStackView = {
            let loginField = UIStackView(axis: .horizontal, distribution: .fillProportionally, alignment: .center)
            loginField.spacing = 20
            
            let loginImageView:UIImageView = {
                let loginImageView = UIImageView()
                loginImageView.translatesAutoresizingMaskIntoConstraints = false
                loginImageView.contentMode = .scaleAspectFit
                loginImageView.alpha = 0.5

                loginImageView.image = UIImage(systemName: image)
                return loginImageView
            }()
            
            loginTextField.placeholder = placeHolder
            
            loginField.addArrangedSubview(loginImageView)
            loginField.addArrangedSubview(loginTextField)
            loginField.addArrangedSubview(deleteImageView)
            
            loginImageView.snp.makeConstraints{ make in
                make.width.equalTo(25)
                make.height.equalTo(25)
            }
            
            loginTextField.snp.makeConstraints{ make in
                make.width.equalTo(90)
                make.height.equalToSuperview()
            }
            
            deleteImageView.snp.makeConstraints{ make in
                make.width.equalTo(20)
                make.height.equalTo(20)
            }
            
            return loginField
        }()
        
        
        addArrangedSubview(loginField)
        loginField.snp.makeConstraints{ make in
            make.width.height.equalToSuperview()
        }
        
    }
}

extension LoginFieldTextView:UITextFieldDelegate{
    // 텍스트 필드의 내용이 바뀔 때마다 호출되는 메서드
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                        
            if loginTextField.text?.count ?? 0 < 2{
                
                deleteImageView.isHidden = true
            }
            else {
                deleteImageView.isHidden = false
            }
            
            return true  // 텍스트를 변경할 수 있도록 허용
        }
}
