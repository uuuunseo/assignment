import UIKit

final class SignupNicknameViewController: BaseViewController {
    
    lazy var chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil).then{
        $0.tintColor = .black
    }
    
    private let authHeader = DotoriAuthHeaderView(text: "사용하실 닉네임을 입력해주세요")
    
    private let nicknameTextField = DotoriTextField(placeholder: "닉네임").then{
        $0.isSecureTextEntry = true
    }
    
    private let nextButton = DotoriButton(setTitle: "다음")
    
    private let signupNicknameRequirements = UILabel().then{
        $0.text = "닉네임은 최소 4자리에서 최대 20자까지 가능합니다"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    @objc func tapNextButton() {
        let completeVC = SignupCompleteViewController()
        navigationController?.pushViewController(completeVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nicknameTextField.delegate = self
    }
    
    override func setup() {
        self.navigationItem.title = "회원가입"
        self.navigationItem.backBarButtonItem = chevronBackBarButtonItem
    }
    
    override func addView() {
        view.addSubviews(authHeader, signupNicknameRequirements, nicknameTextField, nextButton)
    }
    
    override func location() {
        
        signupNicknameRequirements.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(authHeader.snp.bottom).offset(220)
        }
        
        nicknameTextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(signupNicknameRequirements.snp.bottom).offset(28)
            $0.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(52)
        }
    }
}

extension SignupNicknameViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let count = nicknameTextField.text?.count, count >= 4 && count <= 20 {
            nextButton.backgroundColor = UIColor(named: "ButtonColor")
            nextButton.isUserInteractionEnabled = true
            nextButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        } else {
            nextButton.backgroundColor = .gray
            nextButton.isUserInteractionEnabled = false
        }
    }
}
