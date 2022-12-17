import Foundation
import UIKit

extension NSMutableAttributedString {
    func setUnderlineForText(textToFind: String) -> NSMutableAttributedString {
        let range : NSRange = self.mutableString.range(of: textToFind,options: .caseInsensitive)
        self.addAttribute(
            NSAttributedString.Key.underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: range
        )
        return self
    }
}
