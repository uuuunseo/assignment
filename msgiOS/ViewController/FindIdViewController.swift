import Foundation
import UIKit

class FindIdViewController: BaseViewController{
    
    let findIdLabel = UILabel().then{
        $0.text = "아이디찾기"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setup() {
        self.view.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubview(findIdLabel)
    }
    
    override func location() {
        findIdLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
    }
}
