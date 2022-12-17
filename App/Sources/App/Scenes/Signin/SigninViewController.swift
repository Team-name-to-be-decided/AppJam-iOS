import UIKit

final class SigninViewController: BaseViewController {
    private let logoImageView = UIImageView(image: .init(systemName: "apple.logo"))
    private let idTextField = AJTextField(placeholder: "아이디를 입력하세요", header: "아이디", leftImage: AJICon.person.image)
    private let passwordTextField = AJTextField(placeholder: "비밀번호를 입력하세요", header: "비밀번호", leftImage: AJICon.lock.image)
    private let signinButton = AJButton(title: "로그인")

    override func addView() {
        view.addSubviews(logoImageView, idTextField, passwordTextField, signinButton)
    }
}
