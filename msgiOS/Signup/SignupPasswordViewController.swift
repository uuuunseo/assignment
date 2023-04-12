import UIKit

final class SignupPasswordViewController: BaseViewController {
    // MARK: - Properties
    private let chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: SignupPasswordViewController.self, action: nil).then{
        $0.tintColor = .black
    }
    
    private let nextButton = DotoriButton(setTitle: "다음")
    private let authHeader = DotoriAuthHeaderView(text: "사용하실 비밀번호를 입력해주세요")
    private let passwordTextField = DotoriPasswordTextField(placeholder: "비밀번호")
    private let checkPasswordTextField = DotoriPasswordTextField(placeholder: "비밀번호 재입력")
    
    private let signupPasswordRequirements = UILabel().then{
        $0.text = "비밀번호는 최소 8자에서 최대 40자까지 가능합니다."
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    //MARK: Functions
    @objc func tapNextButton() {
        let nicknameVC = SignupNicknameViewController()
        navigationController?.pushViewController(nicknameVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
    }
    
    // MARK: - UI
    override func setup() {
        self.navigationItem.title = "회원가입"
        self.navigationItem.backBarButtonItem = chevronBackBarButtonItem
    }
    
    override func addView() {
        view.addSubviews(authHeader, signupPasswordRequirements, passwordTextField, checkPasswordTextField, nextButton)
    }
    
    override func location() {
            signupPasswordRequirements.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalTo(authHeader.snp.bottom).offset(220)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(signupPasswordRequirements.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
        
        checkPasswordTextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24)
            $0.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
    }
}

// MARK: - extension
extension SignupPasswordViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let count = passwordTextField.text?.count, count >= 8 && count <= 40 {
            if passwordTextField.text == checkPasswordTextField.text {
                nextButton.backgroundColor = UIColor(named: "ButtonColor")
                nextButton.isUserInteractionEnabled = true
                nextButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
            } else {
                nextButton.backgroundColor = .gray
                nextButton.isUserInteractionEnabled = false
            }
        }
    }
}
