import UIKit

final class CardViewController: BaseViewController {
    private let searchingImageView = UIImageView(image: AJICon.connect.image.withRenderingMode(.alwaysOriginal))
    private let searchingLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.text = "주변 기기를 탐색하고 있습니다...\n잠시만 기다려주세요"
        $0.font = .init(font: AJFont.regular, size: 15)
        $0.textColor = AJColor.veryDarkGray.color
    }
    override func addView() {
        view.addSubviews(searchingImageView, searchingLabel)
    }
    override func setLayout() {
        searchingImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        searchingLabel.snp.makeConstraints {
            $0.centerX.equalTo(searchingImageView)
            $0.top.equalTo(searchingImageView.snp.centerY).offset(75)
        }
    }
}
