import UIKit

final class FriendCardDetailViewController: BaseViewController {
    private let scrollView = UIScrollView()
    private let imageView = UIImageView(image: AJICon.friendUserProfile.image)
    override func addView() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(imageView)
    }
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
