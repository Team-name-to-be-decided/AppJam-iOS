import UIKit

extension UINavigationItem {
    func configTitle(
        title: String,
        font: UIFont = UIFont(font: AppJamFontFamily.SpoqaHanSansNeo.regular, size: 17) ?? .init()
    ) {
        let lb = UILabel()
        lb.font = font
        lb.textColor = AppJamAsset.Colors.black.color
        lb.text = title
        self.titleView = lb
    }
}
