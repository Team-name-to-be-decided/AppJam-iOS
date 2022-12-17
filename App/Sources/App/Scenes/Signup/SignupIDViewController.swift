//
//  SingupIDViewController.swift
//  AppJam
//
//  Created by 겸 on 2022/12/17.
//  Copyright © 2022 org.AppJam. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class SignupIDViewController: BaseViewController{
        
    var idTextField = AJTextField(placeholder: " 아이디를 입력하세요", header: "아이디", leftImage: AJICon.person.image)
    
    var pwTextField = AJTextField(placeholder: "비밀번호를 입력하세요", header: "비밀번호", leftImage: AJICon.lock.image)
    
    var completeButton = AJButton(title: "1/3")
    
    override func configureVC() {
//        view.backgroundColor = .systemYellow
    
    }
    
    override func addView() {
        view.addSubviews(idTextField, pwTextField, completeButton)
    }
    
    override func setLayout() {
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(183)
        }
        
        pwTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.top.equalTo(idTextField.snp.bottom).offset(57)
        }
        
        completeButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().inset(90)
        }
    }
    
    override func bind() {
        Observable.zip(idTextField.rx.text.orEmpty, pwTextField.rx.text.orEmpty) {text1, text2 in
            return text1.count >= 1 && text2.count >= 1
        }
        .bind(to: completeButton.rx.isEnabled)
        .disposed(by: disposeBag)
    }
}



#if DEBUG

import SwiftUI

struct SignupIDViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SignupIDViewController()
    }
}


struct SignupIDViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        SignupIDViewControllerPresentable()
            .ignoresSafeArea()
    }
}

#endif

