import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

final class SigninViewController: BaseViewController {
    private let logoImageView = UIImageView(image: AJICon.logo.image.withRenderingMode(.alwaysOriginal))
    private let idTextField = AJTextField(placeholder: "아이디를 입력하세요", header: "아이디", leftImage: AJICon.person.image)
    private let passwordTextField = SecureAJTextField(placeholder: "비밀번호를 입력하세요", header: "비밀번호", leftImage: AJICon.lock.image)
    private let signinButton = AJButton(title: "로그인")
    private let signupButton = UIButton().then {
        $0.setTitleColor(AJColor.darkGray.color, for: .normal)
        $0.titleLabel?.font = .init(font: AJFont.regular, size: 14)
        $0.setAttributedTitle(
            NSMutableAttributedString(string: "계정이 없으신가요? 회원가입하기")
                .setFontForText(
                    textToFind: "회원가입하기",
                    withFont: .init(font: AJFont.medium, size: 14) ?? .init()
                )
                .setColorForText(textToFind: "회원가입하기", withColor: AJColor.primary.color)
                .setUnderlineForText(textToFind: "회원가입하기"),
            for: .normal
        )
    }

    override func addView() {
        view.addSubviews(logoImageView, idTextField, passwordTextField, signupButton, signinButton)
    }

    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(46)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(79)
            $0.height.equalTo(35)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(54)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        signupButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(112)
            $0.centerX.equalToSuperview()
        }
        signinButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(signupButton.snp.top).offset(-20)
        }
    }

    override func configureNavigation() {
        self.navigationItem.configTitle(title: "LOGIN")
    }

    override func bind() {
        Observable.combineLatest(
            idTextField.rx.text.orEmpty,
            passwordTextField.rx.text.orEmpty
        )
        .map { !$0.isEmpty && !$1.isEmpty }
        .bind(to: signinButton.rx.isEnabled)
        .disposed(by: disposeBag)
    }
}
