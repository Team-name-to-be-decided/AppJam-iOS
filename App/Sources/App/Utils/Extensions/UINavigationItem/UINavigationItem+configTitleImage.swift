import UIKit
import SnapKit

extension UINavigationItem {
    func configTitleImage() {
        let iv = UIImageView()
        iv.image = AppJamAsset.Icons.logo.image
        iv.snp.makeConstraints {
            $0.width.equalTo(69)
            $0.height.equalTo(32)
        }
        self.titleView = iv
    }
}
