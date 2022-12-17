import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit

final class SecureAJTextField: UITextField {
    typealias AJColor = AppJamAsset.Colors
    typealias AJFont = AppJamFontFamily.SpoqaHanSansNeo

    private let disposeBag = DisposeBag()
    private let leftImage: UIImage?
    private let secureButton = UIButton().then {
        $0.setImage(.init(systemName: "eye.slash")?.tintColor(AJColor.darkGray.color), for: .normal)
    }

    init(placeholder: String, header: String? = nil, leftImage: UIImage? = nil) {
        self.leftImage = leftImage
        super.init(frame: .zero)
        if let leftImage {
            self.addLeftImage(image: leftImage.tintColor(AJColor.darkGray.color))
        }
        if let header {
            self.addHeaderLabel(title: header)
        }
        self.attributedPlaceholder = .init(string: placeholder, attributes: [
            .foregroundColor: AJColor.darkGray.color
        ])
        self.backgroundColor = AJColor.lightGray.color
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.isSecureTextEntry = true
        self.addRightView(view: secureButton)
        bind()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind() {
        self.rx.controlEvent(.editingDidBegin)
            .bind(with: self) { owner, _ in
                owner.layer.borderColor = AJColor.primary.color.cgColor
                owner.layer.borderWidth = 1
                if let leftImage = owner.leftImage {
                    owner.addLeftImage(image: leftImage.tintColor(AJColor.primary.color))
                }
            }
            .disposed(by: disposeBag)

        self.rx.controlEvent(.editingDidEnd)
            .bind(with: self) { owner, _ in
                owner.layer.borderColor = AJColor.lightGray.color.cgColor
                owner.layer.borderWidth = 0
                if let leftImage = owner.leftImage {
                    owner.addLeftImage(image: leftImage.tintColor(AJColor.darkGray.color))
                }
            }
            .disposed(by: disposeBag)

        self.secureButton.rx.tap
            .bind(with: self) { owner, isSecure in
                owner.isSecureTextEntry.toggle()
                let isSecure = owner.isSecureTextEntry
                let eyeImage = isSecure ? UIImage(systemName: "eye.slash") : .init(systemName: "eye")
                owner.secureButton.setImage(eyeImage?.tintColor(AJColor.darkGray.color), for: .normal)
            }
            .disposed(by: disposeBag)
    }
}
