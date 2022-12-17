import UIKit
import SnapKit
import Then

final class CardCollectionViewCell: BaseCollectionViewCell<CardEntity> {
    private let nameLabel = UILabel().then {
        $0.font = .init(font: AJFont.bold, size: 16)
    }
    private let majorLabel = UILabel().then {
        $0.font = .init(font: AJFont.medium, size: 14)
    }
    private let nameStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
    }
    private let organizationLabel = UILabel().then {
        $0.font = .init(font: AJFont.regular, size: 14)
    }
    
    override func addView() {
        nameStackView.addArrangeSubviews(nameLabel, majorLabel)
        contentView.addSubviews(nameStackView, organizationLabel)
    }

    override func setLayout() {
        nameStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().inset(12)
        }
        organizationLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(16)
        }
    }

    override func configureCell() {
        contentView.layer.cornerRadius = 8
    }

    override func bind(_ model: CardEntity) {
        contentView.backgroundColor = model.major.primaryColor
        nameLabel.text = model.name
        majorLabel.text = model.major.display
        organizationLabel.text = model.organization

        nameLabel.textColor = model.major.foregroundColor
        majorLabel.textColor = model.major.foregroundColor
        organizationLabel.textColor = model.major.foregroundColor
    }
}
