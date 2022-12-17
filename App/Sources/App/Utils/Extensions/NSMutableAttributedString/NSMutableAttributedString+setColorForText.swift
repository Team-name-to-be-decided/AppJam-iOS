import Foundation
import UIKit

extension NSMutableAttributedString {
    func setColorForText(textToFind: String, withColor color: UIColor) -> NSMutableAttributedString {
        let range: NSRange = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        return self
    }
}
