import UIKit
import SnapKit

final class MyPageViewController: BaseViewController {
    private let scrollView = UIScrollView()
    private let myPageImageView = UIImageView(image: AJICon.myPage.image)

    override func addView() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(myPageImageView)
    }
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        myPageImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
