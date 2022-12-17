import UIKit

extension UINavigationItem {
    func configBack(title: String = ""){
        let back = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        back.tintColor = AppJamAsset.Colors.black.color
        self.backBarButtonItem = back
    }
}
