import UIKit
import Then
import Reusable
import SnapKit
import RxSwift
import RxCocoa

final class HomeViewController: BaseViewController {
    private let tagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.register(cellType: TagCollectionViewCell.self)
        $0.backgroundColor = AJColor.white.color
        $0.showsHorizontalScrollIndicator = false
    }
    private let cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        $0.register(cellType: CardCollectionViewCell.self)
        $0.backgroundColor = .clear
    }
    private let tagListRelay = BehaviorRelay(value: Major.allCases)
    private let allCardListRelay = BehaviorRelay<[CardEntity]>(value: [
        .init(
            id: UUID().uuidString,
            name: "최성현",
            major: .pm,
            organization: "COMIT"
        ),
        .init(
            id: UUID().uuidString,
            name: "전승원",
            major: .backend,
            organization: "MSG"
        ),
        .init(
            id: UUID().uuidString,
            name: "장정원",
            major: .design,
            organization: "미림정보과학고등학교"
        ),
        .init(
            id: UUID().uuidString,
            name: "임동현",
            major: .frontend,
            organization: "b1nd"
        ),
        .init(
            id: UUID().uuidString,
            name: "최형우",
            major: .ios,
            organization: "MSG"
        ),
        .init(
            id: UUID().uuidString,
            name: "김준",
            major: .design,
            organization: "MSG"
        ),
        .init(
            id: UUID().uuidString,
            name: "변찬우",
            major: .frontend,
            organization: "The moment"
        ),
        .init(
            id: UUID().uuidString,
            name: "임세현",
            major: .android,
            organization: "DMS"
        ),
        .init(
            id: UUID().uuidString,
            name: "전세현",
            major: .backend,
            organization: "semicolon"
        ),
        .init(
            id: UUID().uuidString,
            name: "이겸",
            major: .ios,
            organization: "인천전자마이스터고등학교"
        ),
        .init(
            id: UUID().uuidString,
            name: "우준성",
            major: .backend,
            organization: "b1nd"
        ),
        
    ])
    private let cardListRelay = BehaviorRelay<[CardEntity]>(value: [])
    private var selectedTag: Major = .all

    override func setUp() {
        tagCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        let layout = CardLayout()
        layout.delegate = self
        cardCollectionView.collectionViewLayout = layout
    }

    override func addView() {
        view.addSubviews(tagCollectionView, cardCollectionView)
    }

    override func setLayout() {
        tagCollectionView.snp.makeConstraints {
            $0.height.equalTo(65)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        cardCollectionView.snp.makeConstraints {
            $0.top.equalTo(tagCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    override func configureNavigation() {
        self.navigationItem.configTitleImage()
        self.navigationItem.configBack()
    }

    override func bind() {
        cardListRelay.accept(allCardListRelay.value)
        tagListRelay
            .bind(to: tagCollectionView.rx.items(
                cellIdentifier: TagCollectionViewCell.reuseIdentifier,
                cellType: TagCollectionViewCell.self)
            ) { [weak self] _, item, cell in
                let isSelected = self?.selectedTag == item
                cell.bind(item, isSelected: isSelected)
            }
            .disposed(by: disposeBag)

        cardListRelay
            .bind(to: cardCollectionView.rx.items(
                cellIdentifier: CardCollectionViewCell.reuseIdentifier,
                cellType: CardCollectionViewCell.self)
            ) { _, item, cell in
                cell.bind(item)
            }
            .disposed(by: disposeBag)

        tagCollectionView.rx.modelSelected(Major.self)
            .bind(with: self) { owner, major in
                owner.selectedTag = major
                owner.tagCollectionView.reloadData()
                owner.cardListRelay.accept(owner.allCardListRelay.value.filter { $0.major == major || major == .all })
            }
            .disposed(by: disposeBag)

        cardCollectionView.rx.modelSelected(CardEntity.self)
            .map { _ in CardDetailViewController() }
            .bind(with: self) { owner, vc in
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: CardLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForItemIndexAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 180
        } else {
            return 210
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return TagCollectionViewCell.fittingSize(availableHeight: 34, major: tagListRelay.value[indexPath.row])
    }
}
