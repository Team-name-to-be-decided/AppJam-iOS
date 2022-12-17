import UIKit
import SnapKit
import Then

extension UIView {
    func addHeaderLabel(title: String) {
        let titleLabel = UILabel().then {
            $0.text = title
            $0.font = .init(font: AppJamFontFamily.SpoqaHanSansNeo.regular, size: 12)
            $0.textColor = AppJamAsset.Colors.veryDarkGray.color
        }
        addSubviews(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(self.snp.top).offset(-8)
        }
    }
}
