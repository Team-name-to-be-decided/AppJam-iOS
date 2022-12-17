import UIKit
import Then

final class MainTabViewController: UITabBarController {
    typealias AJColor = AppJamAsset.Colors
    typealias AJFont = AppJamFontFamily.SpoqaHanSansNeo
    typealias AJICon = AppJamAsset.Icons

    private let homeViewController = UINavigationController(rootViewController: HomeViewController()).then {
        let homeImage = AppJamAsset.Icons.home.image.tintColor(AppJamAsset.Colors.darkGray.color)
        let selectedHomeImage = AppJamAsset.Icons.home.image.tintColor(AppJamAsset.Colors.black.color)
        let homeItem = UITabBarItem(title: "홈", image: homeImage, selectedImage: selectedHomeImage)
        $0.tabBarItem = homeItem
    }

    private let cardViewController = UINavigationController(rootViewController: CardViewController()).then {
        let cardImage = AppJamAsset.Icons.card.image.tintColor(AppJamAsset.Colors.darkGray.color)
        let selectedCardImage = AppJamAsset.Icons.card.image.tintColor(AppJamAsset.Colors.black.color)
        let cardItem = UITabBarItem(title: "주변 사람", image: cardImage, selectedImage: selectedCardImage)
        $0.tabBarItem = cardItem
    }

    private let cardListViewController = UINavigationController(rootViewController: CardListViewController()).then {
        let cardListImage = AppJamAsset.Icons.cardList.image.tintColor(AppJamAsset.Colors.darkGray.color)
        let selectedCardListImage = AppJamAsset.Icons.cardList.image.tintColor(AppJamAsset.Colors.black.color)
        let cardListItem = UITabBarItem(title: "명함 목록", image: cardListImage, selectedImage: selectedCardListImage)
        $0.tabBarItem = cardListItem
    }

    private let myPageViewController = UINavigationController(rootViewController: MyPageViewController()).then {
        let personImage = AppJamAsset.Icons.person.image.tintColor(AppJamAsset.Colors.darkGray.color)
        let selectedPersonImage = AppJamAsset.Icons.person.image.tintColor(AppJamAsset.Colors.black.color)
        let personItem = UITabBarItem(title: "마이페이지", image: personImage, selectedImage: selectedPersonImage)
        $0.tabBarItem = personItem
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setViewControllers([homeViewController, cardViewController, cardListViewController, myPageViewController], animated: true)
        tabBar.tintColor = AJColor.black.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
