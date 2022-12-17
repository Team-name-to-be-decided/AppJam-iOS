import UIKit
import SnapKit

extension UITextField {
    func leftSpace(_ space: CGFloat) {
        let spacer = UIView(frame: .init(x: 0, y: 0, width: space, height: self.frame.height))
        leftView = spacer
        leftViewMode = .always
    }

    func addLeftImage(image: UIImage, space: CGFloat = 12) {
        let leftImage = UIImageView(image: image)
        let view = UIView()
        view.addSubviews(leftImage)
        leftImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(space)
            $0.centerY.equalToSuperview()
        }
        view.snp.makeConstraints {
            $0.size.equalTo(34)
        }
        self.leftView = view
        self.leftViewMode = .always
    }

    func addRightImage(image: UIImage, space: CGFloat = 12) {
        let rightImage = UIImageView(image: image)
        let view = UIView()
        view.addSubviews(rightImage)
        rightImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(space)
            $0.centerY.equalToSuperview()
        }
        view.snp.makeConstraints {
            $0.size.equalTo(34)
        }
        self.leftView = view
        self.leftViewMode = .always
    }

    func addRightView(view: UIView, space: CGFloat = 12) {
        let newview = UIView()
        newview.addSubviews(view)
        view.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.trailing.equalToSuperview().inset(space)
            $0.centerY.equalToSuperview()
        }
        newview.snp.makeConstraints {
            $0.size.equalTo(34)
        }
        self.rightView = newview
        self.rightViewMode = .always
    }
}
