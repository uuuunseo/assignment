import UIKit

final class SignupPasswordViewController: BaseViewController {
    
    var passwordEyeButton = UIButton(type: .custom)
    var checkPasswordEyeButton = UIButton(type: .custom)
    
    lazy var chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil).then{
        $0.tintColor = .black
    }
    
    var nextButton = DotoriButton(setTitle: "다음")
    
    private let authHeader = DotoriAuthHeaderView(text: "사용하실 비밀번호를 입력해주세요")
    
    private let passwordTextField = DotoriTextField(placeholder: "비밀번호").then{
        $0.isSecureTextEntry = true
    }
    
    private let checkPasswordTextField = DotoriTextField(placeholder: "비밀번호 재입력").then{
        $0.isSecureTextEntry = true
    }
    
    private let signupPasswordRequirements = UILabel().then{
        $0.text = "비밀번호는 최소 8자에서 최대 40자까지 가능합니다."
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    private func passwordShownButtonImage() {
        passwordEyeButton = UIButton.init(primaryAction: UIAction(handler: { [weak self]_ in
            self?.passwordTextField.isSecureTextEntry.toggle()
            self?.passwordEyeButton.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        passwordEyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordEyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordEyeButton.configuration = buttonConfiguration
        passwordEyeButton.tintColor = .gray
        
        self.passwordTextField.rightView = passwordEyeButton
        self.passwordTextField.rightViewMode = .always
    }
    
    private func checkPasswordShownButtonImage() {
        checkPasswordEyeButton = UIButton.init(primaryAction: UIAction(handler: { [weak self]_ in
            self?.checkPasswordTextField.isSecureTextEntry.toggle()
            self?.checkPasswordTextField.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        checkPasswordEyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        checkPasswordEyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        checkPasswordEyeButton.configuration = buttonConfiguration
        checkPasswordEyeButton.tintColor = .gray
        
        self.checkPasswordTextField.rightView = checkPasswordEyeButton
        self.checkPasswordTextField.rightViewMode = .always
    }
    
    @objc func tapNextButton() {
        let nicknameVC = SignupNicknameViewController()
        navigationController?.pushViewController(nicknameVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordShownButtonImage()
        checkPasswordShownButtonImage()
        
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
        
    }
    
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
