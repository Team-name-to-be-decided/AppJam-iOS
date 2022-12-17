import UIKit
import SnapKit

final class CardDetailViewController: BaseViewController {
    private let imageView = UIImageView(image: AJICon.userCard.image)

    override func addView() {
        view.addSubviews(imageView)
    }
    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}
