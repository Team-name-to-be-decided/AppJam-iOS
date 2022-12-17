import UIKit
import SnapKit

final class RootViewController: BaseViewController {
    private let textField = AJTextField(placeholder: "아이디", leftImage: AJICon.lock.image)
    private let textField1 = AJTextField(placeholder: "아이디", leftImage: AJICon.lock.image)

    override func addView() {
        view.addSubviews(textField, textField1)
    }

    override func setLayout() {
        textField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
        textField1.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
    }
}
