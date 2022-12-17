import Foundation
import UIKit

extension NSMutableAttributedString {
    func setFontForText(textToFind: String, withFont font: UIFont) -> NSMutableAttributedString {
        let range : NSRange = self.mutableString.range(of: textToFind,options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        return self
    }
}
