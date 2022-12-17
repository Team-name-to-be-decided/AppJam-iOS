//
//  SignupBusinessCardViewController.swift
//  AppJam
//
//  Created by 겸 on 2022/12/18.
//  Copyright © 2022 org.AppJam. All rights reserved.
//

import UIKit

class SignupBusinessCardViewController: BaseViewController {
    
    private let nameTextField = AJTextField(placeholder: "이름을 입력하세요", header: "이름")
    private let contactTextField = AJTextField(placeholder: "예) 010-1234-5678", header: "연착처")
    private let linkTextField = AJTextField(placeholder: "예) Github, Behance 등등", header: "관련 메인 링크")
    private let teamTextField = AJTextField(placeholder: "소속을 입력하세요", header: "소속")
    private let completeButton = AJButton(title: "3/3")
    
    override func configureNavigation() {
        self.navigationItem.configTitle(title: "Business card")
        self.navigationItem.configBack()
    }
    
    override func addView() {
        view.addSubviews(nameTextField, contactTextField, linkTextField, teamTextField, completeButton)
    }
    
    override func setLayout() {
        nameTextField.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(95)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        contactTextField.snp.makeConstraints{
            $0.top.equalTo(nameTextField.snp.bottom).offset(57)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        linkTextField.snp.makeConstraints{
            $0.top.equalTo(contactTextField.snp.bottom).offset(57)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        teamTextField.snp.makeConstraints{
            $0.top.equalTo(linkTextField.snp.bottom).offset(57)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        
        completeButton.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(56)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
    }
    
    override func bind() {
        completeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let nextView = SignupSucceedViewController()
                self?.navigationController?.pushViewController(nextView, animated: true)
            }).disposed(by: disposeBag)
    }
    
}
