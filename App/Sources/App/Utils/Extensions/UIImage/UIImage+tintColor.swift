import UIKit

extension UIImage {
    func tintColor(_ color: UIColor) -> UIImage{
        return self.withTintColor(color, renderingMode: .alwaysOriginal)
    }
}
