//
//  SignupSucceedViewController.swift
//  AppJam
//
//  Created by 겸 on 2022/12/18.
//  Copyright © 2022 org.AppJam. All rights reserved.
//

import UIKit

class SignupSucceedViewController: BaseViewController {
    
    private let checkIconView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Check")
        return imageView
    }()
    
    private let completeLabel = UILabel().then{
        $0.text = "회원가입 완료"
        $0.textColor = UIColor.black
        $0.font = UIFont(font: AJFont.medium, size: 24 )
    }
    
    private let subLabel = UILabel().then{
        $0.text = "지금부터 추혜연님은 서비스명을 이용할 수 있습니다\n 자신이 가진 명함으로 매칭 신청을 해보세요"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = AJColor.veryDarkGray.color
        $0.font = UIFont(font: AJFont.regular, size: 12 )
    }


    private let completeButton = AJButton(title: "매칭 신청하러 가기")
    
    override func addView() {
        view.addSubviews(checkIconView, completeLabel, subLabel, completeButton)
    }
    
    override func setLayout() {
        
        checkIconView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(250)
        }
        
        completeLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(checkIconView.snp.bottom).offset(22)
        }
        
        subLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(completeLabel.snp.bottom).offset(11)
        }
        
        completeButton.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(56)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
    }
}
