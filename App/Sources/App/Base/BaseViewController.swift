import UIKit
import RxSwift
import Then

class BaseViewController: UIViewController {
    typealias AJColor = AppJamAsset.Colors
    typealias AJFont = AppJamFontFamily.SpoqaHanSansNeo

    let bound = UIScreen.main.bounds
    var disposeBag: DisposeBag = .init()
    
    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        addView()
        setLayout()
        configureVC()
        bind()
        configureNavigation()
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    func setUp(){}
    func addView(){}
    func setLayout(){}
    func configureVC(){}
    func bind(){}
    func configureNavigation(){}
}
