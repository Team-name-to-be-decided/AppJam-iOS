//
//  SignupSelectViewController.swift
//  AppJam
//
//  Created by 겸 on 2022/12/18.
//  Copyright © 2022 org.AppJam. All rights reserved.
//

import UIKit
import Then
import RxCocoa


class SignupSelectViewController : BaseViewController {
    
    private let cameraImageView : UIImageView = {
        let firstImageView = UIImageView()
        firstImageView.image = UIImage(named: "camera")
        return firstImageView
    }()
    
    private let docImageView : UIImageView = {
        let secondImageView = UIImageView()
        secondImageView.image = UIImage(named: "doc")
        return secondImageView
    }()
    
    private let firstButton = UIButton().then{
        $0.backgroundColor = UIColor.systemBlue
        let image = UIImage(named: "selectFirst")
        $0.layer.cornerRadius = 15
        $0.setBackgroundImage(image, for: .normal)
        $0.layer.borderWidth = 2.5
        $0.layer.borderColor = UIColor.clear.cgColor
    }
    
    private let secondButton = UIButton().then{
        $0.backgroundColor = UIColor.systemBlue
        let image = UIImage(named: "selectSecond")
        $0.setBackgroundImage(image, for: .normal)
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 2.5
        $0.layer.borderColor = UIColor.clear.cgColor
    }
    
    private let firstLabel = UILabel().then{
        $0.text = "명함 촬영하기"
        $0.textColor = UIColor.white
        $0.font = UIFont(font: AJFont.regular, size: 14 )
    }
    
    private let secondLabel = UILabel().then{
        $0.text = "정보 입력으로 명함 만들기"
        $0.textColor = UIColor.white
        $0.font = UIFont(font: AJFont.regular, size: 14 )

    }
    
    private let completeButton = AJButton(title: "선택하기")

    override func addView() {
        view.addSubviews(firstButton,secondButton, completeButton)
        firstButton.addSubviews(cameraImageView, firstLabel)
        secondButton.addSubviews(docImageView, secondLabel)
    }
    
    override func configureNavigation() {
        self.navigationItem.configTitle(title: "Business card")
        self.navigationItem.configBack()
    }
    
    override func setLayout() {
        
        firstButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(108)
            $0.width.equalTo(335)
            $0.height.equalTo(178)
            $0.centerX.equalToSuperview()
        }
        
        cameraImageView.snp.makeConstraints{
            $0.centerY.centerX.equalToSuperview()
        }
        
        firstLabel.snp.makeConstraints{
            $0.top.equalTo(cameraImageView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        secondButton.snp.makeConstraints{
            $0.top.equalTo(firstButton.snp.bottom).offset(64)
            $0.width.equalTo(335)
            $0.height.equalTo(178)
            $0.centerX.equalToSuperview()
        }
        
        docImageView.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints{
            $0.top.equalTo(docImageView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalTo(view.snp.bottom).inset(90)
            $0.height.equalTo(52)
        }
    }
    
    override func bind() {
        completeButton.isEnabled = false
        
        firstButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                if self?.firstButton.layer.borderColor == UIColor.clear.cgColor {
                    self?.firstButton.layer.borderColor = AJColor.primary.color.cgColor
                } else {
                    self?.firstButton.layer.borderColor = UIColor.clear.cgColor
                }
            })
            .disposed(by: disposeBag)
        
        secondButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [weak self] in
                self?.completeButton.isEnabled = true
                if self?.secondButton.layer.borderColor == UIColor.clear.cgColor {
                    self?.secondButton.layer.borderColor = AJColor.primary.color.cgColor
                } else {
                    self?.secondButton.layer.borderColor = UIColor.clear.cgColor
                }
            })
            .disposed(by: disposeBag)
        
        completeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let nextView = SignupBusinessCardViewController()
                self?.navigationController?.pushViewController(nextView, animated: true)
            }).disposed(by: disposeBag)
    }
}



#if DEBUG

import SwiftUI

struct SignupSelectViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SignupSelectViewController()
    }
}


struct SignupSelectViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        SignupSelectViewControllerPresentable()
            .ignoresSafeArea()
    }
}

#endif

