import Foundation
import UIKit

class SignupIdViewController: BaseViewController {
    
    lazy var chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil).then{
        $0.tintColor = .black
    }
    
    var authHeader = DotoriAuthHeaderView().then{
        $0.logoExplanationLabel.text = "사용하실 아이디를 입력해주세요"
    }
    
    var signupIdTextfield = DotoriTextField().then{
        $0.placeholder = "아이디"
    }
    
    var nextButton = DotoriButton().then{
        $0.setTitle("다음", for: .normal)
    }
    
    let signupIdRequirements = UILabel().then{
        $0.text = "아이디는 최소 4자에서 최대 20자까지 가능합니다."
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    override func setup() {
        self.navigationItem.title = "회원가입"
        self.view.backgroundColor = .white
        signupIdTextfield.delegate = self
        self.navigationItem.backBarButtonItem = chevronBackBarButtonItem
    }
    
    override func addView() {
        view.addSubview(authHeader)
        view.addSubview(signupIdRequirements)
        view.addSubview(signupIdTextfield)
        view.addSubview(nextButton)
    }
    
    override func location() {
        signupIdRequirements.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalTo(authHeader.snp.bottom).offset(220)
        }
        
        signupIdTextfield.snp.makeConstraints{
            $0.top.equalTo(signupIdRequirements.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(52)
        }
    }
    
    @objc func tapNextButton() {
        let next = SignupPasswordViewController()
        navigationController?.pushViewController(next, animated: true)
    }
}

extension SignupIdViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let count = signupIdTextfield.text?.count, count >= 4 && count <= 20 {
            nextButton.backgroundColor = UIColor(named: "ButtonColor")
            nextButton.isUserInteractionEnabled = true
            nextButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        } else {
            nextButton.backgroundColor = .gray
            nextButton.isUserInteractionEnabled = false
        }
        
        return true
    }
}
