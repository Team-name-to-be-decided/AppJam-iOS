import UIKit
import Combine
import ViewAnimator

final class CardViewController: BaseViewController {
    private let searchingImageView = UIImageView(image: AJICon.connect.image.withRenderingMode(.alwaysOriginal))
    private let searchingLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "주변 기기를 탐색하고 있습니다...\n잠시만 기다려주세요"
        $0.font = .init(font: AJFont.regular, size: 15)
        $0.textColor = AJColor.veryDarkGray.color
    }
    private let nearDeviceListBackgroundView = UIView().then {
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.layer.cornerRadius = 16
        $0.backgroundColor = AJColor.white.color
        $0.isHidden = true
    }
    private let nearDeviceTitleLabel = UILabel().then {
        $0.text = "주변 기기"
        $0.textAlignment = .center
        $0.font = .init(font: AJFont.medium, size: 15)
        $0.textColor = AJColor.black.color
        $0.isHidden = true
    }
    private let phoneImage = UIImageView(image: .init(systemName: "iphone")).then {
        $0.isHidden = true
    }
    private let phoneName = UILabel().then {
        $0.text = "최형우의 Macbook Pro"
        $0.isHidden = true
    }
    private let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    private var bag = Set<AnyCancellable>()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.nearDeviceTitleLabel.isHidden = false
            self.nearDeviceListBackgroundView.isHidden = false
            UIView.animate(views: [
                self.nearDeviceListBackgroundView,
                self.nearDeviceTitleLabel,
            ], animations: [
                AnimationType.from(direction: .bottom, offset: 600)
            ])
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.phoneImage.isHidden = false
            self.phoneName.isHidden = false
        }
    }
    
    override func addView() {
        view.addSubviews(searchingImageView, searchingLabel, nearDeviceListBackgroundView)
        nearDeviceListBackgroundView.addSubviews(nearDeviceTitleLabel, phoneImage, phoneName)
    }
    override func setLayout() {
        searchingImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        searchingLabel.snp.makeConstraints {
            $0.centerX.equalTo(searchingImageView)
            $0.top.equalTo(searchingImageView.snp.centerY).offset(75)
        }
        nearDeviceListBackgroundView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(90)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        nearDeviceTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(14)
        }
        phoneImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(nearDeviceTitleLabel.snp.bottom).offset(44)
        }
        phoneName.snp.makeConstraints {
            $0.centerY.equalTo(phoneImage)
            $0.leading.equalTo(phoneImage.snp.trailing).offset(12)
        }
    }
    override func configureVC() {
        view.backgroundColor = AJColor.bg.color
    }
    override func bind() {
        timer
            .sink { [weak self] out in
                if self?.searchingLabel.text == "주변 기기를 탐색하고 있습니다...\n잠시만 기다려주세요" {
                    self?.searchingLabel.text = "주변 기기를 탐색하고 있습니다..\n잠시만 기다려주세요"
                    
                } else if self?.searchingLabel.text == "주변 기기를 탐색하고 있습니다..\n잠시만 기다려주세요" {
                    self?.searchingLabel.text = "주변 기기를 탐색하고 있습니다.\n잠시만 기다려주세요"
                    
                } else if self?.searchingLabel.text == "주변 기기를 탐색하고 있습니다.\n잠시만 기다려주세요" {
                    self?.searchingLabel.text = "주변 기기를 탐색하고 있습니다...\n잠시만 기다려주세요"
                }
            }
            .store(in: &bag)
    }
}
