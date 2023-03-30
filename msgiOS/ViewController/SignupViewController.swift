import Foundation
import UIKit

class SignupViewController: BaseViewController {
    
    let signupLabel = UILabel().then{
        $0.text = "회원가입"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    override func setup() {
        self.navigationItem.title = "회원가입"
        self.view.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubview(signupLabel)
    }
    
    override func location() {
        signupLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
