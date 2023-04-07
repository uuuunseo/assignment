import Foundation
import UIKit

class SignupPasswordViewController: BaseViewController {
    
    var passwordEyeButton = UIButton(type: .custom)
    var checkPasswordEyeButton = UIButton(type: .custom)
    
    lazy var chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil).then{
        $0.tintColor = .black
    }
    
    var authHeader = DotoriAuthHeaderView().then{
        $0.logoExplanationLabel.text = "사용하실 비밀번호를 입력해주세요"
    }
    
    var passwordTextField = DotoriTextField().then{
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    
    var checkPasswordTextField = DotoriTextField().then{
        $0.placeholder = "비밀번호 재입력"
        $0.isSecureTextEntry = true
    }
    
    var nextButton = DotoriButton().then{
        $0.setTitle("다음", for: .normal)
    }
    
    let signupPasswordRequirements = UILabel().then{
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
        self.passwordEyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        self.passwordEyeButton.configuration = buttonConfiguration
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
        self.checkPasswordEyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        self.checkPasswordEyeButton.configuration = buttonConfiguration
        checkPasswordEyeButton.tintColor = .gray
        
        self.checkPasswordTextField.rightView = checkPasswordEyeButton
        self.checkPasswordTextField.rightViewMode = .always
    }
    
    @objc func tapNextButton() {
        let next = SignupNicknameViewController()
        navigationController?.pushViewController(next, animated: true)
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
        self.view.backgroundColor = .white
        self.navigationItem.backBarButtonItem = chevronBackBarButtonItem
    }
    
    override func addView() {
        view.addSubview(authHeader)
        view.addSubview(signupPasswordRequirements)
        view.addSubview(passwordTextField)
        view.addSubview(checkPasswordTextField)
        view.addSubview(nextButton)
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
