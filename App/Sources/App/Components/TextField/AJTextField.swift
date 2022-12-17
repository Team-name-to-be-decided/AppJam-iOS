import UIKit
import RxSwift
import RxCocoa

final class AJTextField: UITextField {
    typealias AJColor = AppJamAsset.Colors
    typealias AJFont = AppJamFontFamily.SpoqaHanSansNeo

    private let disposeBag = DisposeBag()
    private let leftImage: UIImage?

    init(placeholder: String, leftImage: UIImage? = nil) {
        self.leftImage = leftImage
        super.init(frame: .zero)
        if let leftImage {
            self.addLeftImage(image: leftImage.tintColor(AJColor.darkGray.color))
        }
        self.attributedPlaceholder = .init(string: placeholder, attributes: [
            .foregroundColor: AJColor.darkGray.color
        ])
        self.backgroundColor = AJColor.lightGray.color
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
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
    }
}
