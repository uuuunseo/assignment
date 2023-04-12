import UIKit

final class MainViewController: BaseViewController {
    // MARK: - Properties
    private let mainLabel = UILabel().then{
        $0.text = "메인"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubviews(mainLabel)
    }
    
    override func setup() {
        self.navigationItem.title = "메인"
    }
    
    override func location() {
        mainLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
}
