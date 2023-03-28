import Foundation
import UIKit

class FindPasswordViewController: BaseViewController {
    
    let findPasswordLabel = UILabel().then{
        $0.text = "비밀번호찾기"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addView()
        location()
    }
    
    override func setup() {
        self.view.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubview(findPasswordLabel)
    }
    
    override func location() {
        findPasswordLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
    }
}
