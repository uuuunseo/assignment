import Foundation
import UIKit

class MainViewController: BaseViewController {
    
    let mainLabel = UILabel().then{
        $0.text = "메인"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addView()
        location()
    }
    
    override func addView() {
        view.addSubview(mainLabel)
    }
    
    override func setup() {
        self.navigationItem.title = "메인"
        self.view.backgroundColor = .white
    }
    
    override func location() {
        mainLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
