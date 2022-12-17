//
//  StartingViewController.swift
//  AppJam
//
//  Created by 겸 on 2022/12/18.
//  Copyright © 2022 org.AppJam. All rights reserved.
//

import UIKit
import SnapKit

class StartingViewController: BaseViewController {

    private let signinButton = AJButton(title: "로그인")
    private let signupButton = AJButton(title: "회원가입 하러가기")
    
    private let leftImage : UIImageView = {
        let leftImageView = UIImageView()
        leftImageView.image = UIImage(named: "left")
        return leftImageView
    }()
    
    private let rightImage : UIImageView = {
        let rightImageView = UIImageView()
        rightImageView.image = UIImage(named: "right")
        return rightImageView
    }()
    
    private let leftTopImage : UIImageView = {
        let leftTopImageView = UIImageView()
        leftTopImageView.image = UIImage(named: "left_top")
        return leftTopImageView
    }()
    
    private let logo : UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: AJICon.logo.name)
        return logo
    }()
    
    private let logoLabel : UIImageView = {
        let logoLabel = UIImageView()
        logoLabel.image = UIImage(named: "MixandMatch")
        return logoLabel
    }()

    override func addView(){
        view.addSubviews(signupButton, leftImage, rightImage,leftTopImage, signinButton, logo, logoLabel)
    }
    
    override func setLayout(){
        signupButton.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(58)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        signinButton.snp.makeConstraints{
            $0.bottom.equalTo(signupButton.snp.top).inset(-20)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        leftImage.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(132.5)
        }
        
        rightImage.snp.makeConstraints{
            $0.bottom.equalTo(signinButton.snp.top).inset(-92)
            $0.right.equalToSuperview()
        }
        
        leftTopImage.snp.makeConstraints{
            $0.left.top.equalToSuperview()
        }
        
        logo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(149)
            $0.width.equalTo(79.41)
            $0.height.equalTo(35.16)
        }
        
        logoLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logo.snp.bottom).offset(18.13)
            $0.width.equalTo(109)
            $0.height.equalTo(20)
        }
    }
    
    override func configureNavigation() {
        self.navigationItem.configBack()
    }
    
    override func bind() {
        signinButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let nextView = SigninViewController()
                self?.navigationController?.pushViewController(nextView, animated: true)
            }).disposed(by: disposeBag)
        
        signupButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let nextView = SignupIDViewController()
                self?.navigationController?.pushViewController(nextView, animated: true)
            }).disposed(by: disposeBag)

    }
    
    
    
}

#if DEBUG

import SwiftUI

struct StartingViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        StartingViewController()
    }
}


struct StartingViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        StartingViewControllerPresentable()
            .ignoresSafeArea()
    }
}

#endif

