import UIKit
import Then
import SnapKit

final class TagCollectionViewCell: BaseCollectionViewCell<Major> {
    // MARK: - Properties
    private let nameLabel = UILabel().then {
        $0.clipsToBounds = true
        $0.textAlignment = .center
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        model = nil
    }

    // MARK: - UI
    override func addView() {
        contentView.addSubviews(nameLabel)
    }

    override func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }

    override func configureCell() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 17
        self.backgroundColor = .clear
    }

    override func bind(_ model: Major) {
        nameLabel.text = model.display
    }

    func bind(_ model: Major, isSelected: Bool) {
        self.bind(model)
        contentView.backgroundColor = isSelected ? AJColor.black.color : AJColor.white.color
        nameLabel.textColor = isSelected ? AJColor.white.color : AJColor.black.color
    }

    static func fittingSize(availableHeight: CGFloat, major: Major) -> CGSize {
        let cell = TagCollectionViewCell()
        cell.model = major
        let target = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        let width = cell.contentView.systemLayoutSizeFitting(target, withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required).width + 24
        return .init(width: width, height: availableHeight)
    }
}
