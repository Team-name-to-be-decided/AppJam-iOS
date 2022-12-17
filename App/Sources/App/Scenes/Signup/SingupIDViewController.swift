//
//  SingupIDViewController.swift
//  AppJam
//
//  Created by 겸 on 2022/12/17.
//  Copyright © 2022 org.AppJam. All rights reserved.
//

import UIKit
import SnapKit

class SingupIDViewController: BaseViewController{
    var idTextField : AJTextField!

        
    override func configureVC() {
        view.backgroundColor = .systemYellow
    }
    
    override func addView() {
        idTextField = AJTextField(placeholder: "아이디를 입력하세요", leftImage: AJICon.person.image)
        view.addSubview(idTextField)
    }
    
    override func setLayout() {
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(183)
        }
    }



}

#if DEBUG

import SwiftUI

struct SingupIDViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SingupIDViewController()
    }
}


struct SingupIDViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        SingupIDViewControllerPresentable()
            .ignoresSafeArea()
    }
}

#endif

