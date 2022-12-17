import UIKit

final class AJButton: UIButton {
    typealias AJColor = AppJamAsset.Colors
    typealias AJFont = AppJamFontFamily.SpoqaHanSansNeo

    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? AJColor.primary.color : AJColor.lightPrimary.color
        }
    }

    init(title: String) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.backgroundColor = isEnabled ? AJColor.primary.color : AJColor.lightPrimary.color
        self.setTitle(title, for: .normal)
        self.setTitleColor(AJColor.white.color, for: .normal)
        self.titleLabel?.font = .init(font: AJFont.bold, size: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
