import UIKit
import RxSwift
import Reusable

class BaseCollectionViewCell<T>: UICollectionViewCell, Reusable {
    typealias AJColor = AppJamAsset.Colors
    typealias AJFont = AppJamFontFamily.SpoqaHanSansNeo
    typealias AJICon = AppJamAsset.Icons

    let bound = UIScreen.main.bounds
    lazy var disposeBag: DisposeBag = .init()
    var model: T? {
        didSet { if let model = model { bind(model) } }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
        configureCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addView(){}
    func setLayout(){}
    func configureCell(){}
    func bind(_ model: T){}
}
