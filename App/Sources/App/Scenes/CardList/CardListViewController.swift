import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Reusable

final class CardListViewController: BaseViewController {
    private let cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.register(cellType: CardCollectionViewCell.self)
        $0.backgroundColor = .clear
    }
    private let cardListRelay = BehaviorRelay<[CardEntity]>(value: [
        .init(
            id: UUID().uuidString,
            name: "최성현",
            major: .pm,
            organization: "COMIT"
        ),
        .init(
            id: UUID().uuidString,
            name: "장정원",
            major: .design,
            organization: "미림정보과학고등학교"
        ),
        .init(
            id: UUID().uuidString,
            name: "최형우",
            major: .ios,
            organization: "MSG"
        ),
        .init(
            id: UUID().uuidString,
            name: "전승원",
            major: .backend,
            organization: "MSG"
        ),
        .init(
            id: UUID().uuidString,
            name: "변찬우",
            major: .frontend,
            organization: "the moment"
        ),
        .init(
            id: UUID().uuidString,
            name: "임세현",
            major: .android,
            organization: "DMS"
        ),
        .init(
            id: UUID().uuidString,
            name: "이현빈",
            major: .android,
            organization: "MSG"
        )
    ])
    
    
    override func setUp() {
        let layout = CardLayout()
        layout.delegate = self
        cardCollectionView.collectionViewLayout = layout
    }
    override func addView() {
        view.addSubviews(cardCollectionView)
    }
    override func setLayout() {
        cardCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    override func bind() {
        cardListRelay
            .bind(to: cardCollectionView.rx.items(
                cellIdentifier: CardCollectionViewCell.reuseIdentifier,
                cellType: CardCollectionViewCell.self)
            ) { _, item, cell in
                cell.bind(item)
            }
            .disposed(by: disposeBag)
    }
    override func configureNavigation() {
        self.navigationItem.title = "명함목록"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
}

extension CardListViewController: CardLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForItemIndexAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 180
        } else {
            return 210
        }
    }
}
