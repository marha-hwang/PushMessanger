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
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = Design.commonColor
        
        navigationItem.title = "settings".localized()
        
        setupViews()
    }
    
    private func setupViews(){
        let outer:UIStackView = {
            let outer = UIStackView(axis: .vertical, distribution: .equalSpacing, alignment: .top)
            outer.backgroundColor = .white
            
            let screenLock:UIStackView = {
                let screenLock = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .center)
                screenLock.addBorder([.bottom], width: 1, color: .lightGray)
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLockSetting))
                screenLock.addGestureRecognizer(tapGesture)
                
                let label:UILabel = {
                    let label = UILabel()
                    label.text = "set_screen_lock".localized()
                    
                    return label
                }()
                
                let imageView:UIImageView = {
                    let imageView = UIImageView()
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    imageView.contentMode = .scaleToFill
                    imageView.tintColor = .black
                    imageView.image = UIImage(systemName: "chevron.forward")
                    return imageView
                }()
                
                screenLock.addArrangedSubview(label)
                screenLock.addArrangedSubview(imageView)
                
                imageView.snp.makeConstraints{
                    $0.width.height.equalTo(20)
                }
                
                return screenLock
            }()
            
            let notificationSound:UIStackView = {
                let notificationSound = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .center)
                notificationSound.addBorder([.bottom], width: 1, color: .lightGray)
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showNotificationSetting))
                notificationSound.addGestureRecognizer(tapGesture)
                
                let label:UILabel = {
                    let label = UILabel()
                    label.text = "set_notification_sound".localized()
                    
                    return label
                }()
                
                let imageView:UIImageView = {
                    let imageView = UIImageView()
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    imageView.contentMode = .scaleToFill
                    imageView.tintColor = .black
                    imageView.image = UIImage(systemName: "chevron.forward")
                    return imageView
                }()
                
                notificationSound.addArrangedSubview(label)
                notificationSound.addArrangedSubview(imageView)
                
                imageView.snp.makeConstraints{
                    $0.width.height.equalTo(20)
                }
                
                return notificationSound
            }()
            
            let appInfo:UIStackView = {
                let appInfo = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .center)
                appInfo.addBorder([.bottom], width: 1, color: .lightGray)
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showAppInfo))
                appInfo.addGestureRecognizer(tapGesture)
                
                let label:UILabel = {
                    let label = UILabel()
                    label.text = "app_info".localized()
                    
                    return label
                }()
                
                let imageView:UIImageView = {
                    let imageView = UIImageView()
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    imageView.contentMode = .scaleToFill
                    imageView.tintColor = .black
                    imageView.image = UIImage(systemName: "chevron.forward")
                    return imageView
                }()
                
                appInfo.addArrangedSubview(label)
                appInfo.addArrangedSubview(imageView)
                
                imageView.snp.makeConstraints{
                    $0.width.height.equalTo(20)
                }
                
                return appInfo
            }()
            
            outer.addArrangedSubview(screenLock)
            outer.addArrangedSubview(notificationSound)
            outer.addArrangedSubview(appInfo)
            
            screenLock.snp.makeConstraints{
                $0.trailing.leading.equalToSuperview().inset(10)
                $0.height.equalTo(50)
            }
            
            notificationSound.snp.makeConstraints{
                $0.trailing.leading.equalToSuperview().inset(10)
                $0.height.equalTo(50)
            }
            
            appInfo.snp.makeConstraints{
                $0.trailing.leading.equalToSuperview().inset(10)
                $0.height.equalTo(50)
            }
            
            return outer
        }()
        
        view.addSubview(outer)
        
        outer.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    @objc func showLockSetting() {
        viewModel.showLockSetting()
    }
    
    @objc func showNotificationSetting() {
        viewModel.showNotificationSetting()
    }
    
    @objc func showAppInfo() {
        viewModel.showAppInfo()
    }
}
