import UIKit

class MainViewController: BaseViewController {
    
    private let mainLabel = UILabel().then{
        $0.text = "메인"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    override func addView() {
        view.addSubview(mainLabel)
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
