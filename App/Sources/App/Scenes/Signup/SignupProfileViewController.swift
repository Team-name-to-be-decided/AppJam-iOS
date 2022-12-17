//
//  SignupProfileViewController.swift
//  AppJam
//
//  Created by 겸 on 2022/12/18.
//  Copyright © 2022 org.AppJam. All rights reserved.
//

import UIKit
import SnapKit

final class SignupProfileViewController: BaseViewController {
    
    private let hobbyTextField = AJTextField(placeholder: "취미를 입력하세요", header: "취미")
    private let jobTextField = AJTextField(placeholder: "직무분야를 입력하세요", header: "직무분야")
    private let interestTextField = AJTextField(placeholder: "관심분야를 입력하세요", header: "관심분야")
    private let skillTextField = AJTextField(placeholder: "기술스택을 입력하세요", header: "기술스택")
    private let contactTextField = AJTextField(placeholder: "예) 010-1234-5678", header: "연락처")
    private let selfIntroduceTextField = AJTextField(placeholder: "예) 관련 링크 (List,Optional), Github 등등", header: "자기소개")
    private let completeButton = AJButton(title: "2/3")
    
    let contentView = UIView().then{_ in
        
    }

    
    let scrollView = UIScrollView().then{
        $0.alwaysBounceVertical = true
        $0.isUserInteractionEnabled = true
    }
    
    
    
    override func addView() {
        view.addSubviews(scrollView)
        contentView.addSubviews(hobbyTextField, jobTextField, interestTextField, skillTextField, contactTextField, selfIntroduceTextField, completeButton)
        scrollView.addSubview(contentView)
        
    }
    
    override func configureVC() {
    }
    
    override func setLayout() {
        scrollView.updateContentSize()

        
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.height.equalTo(scrollView)
        }

        hobbyTextField.snp.makeConstraints{
            $0.top.equalToSuperview().offset(95)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        jobTextField.snp.makeConstraints{
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(57)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        interestTextField.snp.makeConstraints{
            $0.top.equalTo(jobTextField.snp.bottom).offset(57)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        skillTextField.snp.makeConstraints{
            $0.top.equalTo(interestTextField.snp.bottom).offset(57)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        contactTextField.snp.makeConstraints{
            $0.top.equalTo(skillTextField.snp.bottom).offset(57)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        selfIntroduceTextField.snp.makeConstraints{
            $0.top.equalTo(contactTextField.snp.bottom).offset(57)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        completeButton.snp.makeConstraints{
            $0.top.equalTo(selfIntroduceTextField.snp.bottom).offset(34)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
    }
    
    override func configureNavigation() {
        self.navigationItem.configTitle(title: "Profile Card")
        self.navigationItem.configBack()
        completeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let nextView = SignupSelectViewController()
                self?.navigationController?.pushViewController(nextView, animated: true)
            }).disposed(by: disposeBag)
    }
}

#if DEBUG

import SwiftUI

struct SignupProfileViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SignupProfileViewController()
    }
}


struct SignupProfileViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        SignupProfileViewControllerPresentable()
            .ignoresSafeArea()
    }
}

#endif

