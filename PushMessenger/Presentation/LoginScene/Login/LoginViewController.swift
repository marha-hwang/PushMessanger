//
//  LoginViewController.swift
//  PushMessenger
//
//  Created by haram on 1/13/25.
//

import UIKit
import SwiftUI
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
        
        // 키보드 알림 옵저버 등록
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    deinit {
        // 알림 옵저버 제거
        NotificationCenter.default.removeObserver(self)
    }
    
    // 키보드가 나타날 때 호출되는 메서드
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        // 키보드의 끝 위치를 얻기 위해 사용
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let keyboardHeight = keyboardFrame.height
        
        // 키보드가 나타날 때 뷰를 올리기
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = -keyboardHeight // 화면을 키보드만큼 올리기
        }
    }

    // 키보드가 사라질 때 호출되는 메서드
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0 // 원래 위치로 복귀
        }
    }
    
    @objc private func loginEvent(sender: UITapGestureRecognizer){
        viewModel.confirmLogin(id: "aa", password: "bbb", phoneNumber: "ccc")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // 키보드 숨기기
    }
    
    private lazy var idTextField:LoginFieldTextView = {
        let loginTextView = LoginFieldTextView()
        loginTextView.initLoginFieldTextView(image: "person.fill", placeHolder: "id".localized(), type:.plain)
        return loginTextView
    }()
    
    private lazy var passwordTextField:LoginFieldTextView = {
        let loginTextView = LoginFieldTextView()
        loginTextView.initLoginFieldTextView(image: "lock.fill", placeHolder: "password".localized(), type:.password)
        return loginTextView
    }()
    
    private lazy var phoneNumberTextField:LoginFieldTextView = {
        let loginTextView = LoginFieldTextView()
        loginTextView.initLoginFieldTextView(image: "phone.fill", placeHolder: "phone_number".localized(), type: .phoneNumber)
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
    
    enum LoginFieldType {
        case plain
        case password
        case phoneNumber
    }
    
    private var type:LoginFieldType = .plain
        
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
        deleteImageView.isHidden = true
    }
    
    func initLoginFieldTextView(image:String, placeHolder:String, type:LoginFieldType){
        
        self.type = type
        
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
            
            if type == .password{
                loginTextField.isSecureTextEntry = true
            }
            else if type == .phoneNumber{
                loginTextField.keyboardType = .numberPad
            }
            
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

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
            let newText = (textField.text as? NSString ?? "").replacingCharacters(in: range, with: string)
            
            if newText == "" { deleteImageView.isHidden = true}
            else { deleteImageView.isHidden = false }
                        
            if type == .phoneNumber{
                let digits = newText.replacingOccurrences(of: " - ", with: "")
                textField.text = replacePhoneNumber(digits.getString(0, min(11, digits.count)))
                
                return false
            }

            
            
            return true  // 텍스트를 변경할 수 있도록 허용
        }
    
    func replacePhoneNumber(_ digits: String) -> String {
            // 뒤 4자리 (지역번호)
            if digits.count >= 8 {
                return  "\(digits.getString(0, 3)) - \(digits.getString(3, 7)) - \(digits.getString(7, digits.count > 11 ? 11:digits.count))"
            }
            
            // 중간 4자리
            if digits.count >= 4 {
                return  "\(digits.getString(0, 3)) - \(digits.getString(3, digits.count))"
            }
            
        return digits.getString(0, digits.count)
    }
}

