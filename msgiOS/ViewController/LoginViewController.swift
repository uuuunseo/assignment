import UIKit

class LoginViewController: BaseViewController {
    
    var eyeButton = UIButton(type: .custom)
    
    lazy var chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil).then{
        $0.tintColor = .black
    }
    
    lazy var loginEmailTextField = UITextField().then{
        $0.placeholder = "아이디"
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.leftPadding()
    }
    
    lazy var loginPasswordTextField = UITextField().then{
        $0.placeholder = "비밀번호"
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.isSecureTextEntry = true
        $0.leftPadding()
    }
    
    lazy var findIdButton = UIButton().then{
        $0.setTitle("아이디찾기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    lazy var resetPasswordButton = UIButton().then{
        $0.setTitle("비밀번호재설정", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    lazy var signupButton = UIButton().then{
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    lazy var loginButton = UIButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 8
    }
    
    let contourImageView = UIImageView().then{
        $0.image = UIImage(named: "Line 3")
    }
    
    let authHeaderView = DotoriAuthHeaderView()
    
    let signupQuestionLabel = UILabel().then{
        $0.text = "아직 회원이 아니신가요?"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    private func setPasswordShownButtonImage() {
        eyeButton = UIButton.init(primaryAction: UIAction(handler: { [weak self]_ in
            self?.loginPasswordTextField.isSecureTextEntry.toggle()
            self?.eyeButton.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        self.eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        self.eyeButton.configuration = buttonConfiguration
        eyeButton.tintColor = .gray
        
        self.loginPasswordTextField.rightView = eyeButton
        self.loginPasswordTextField.rightViewMode = .always
    }
    
    @objc func tapLoginButton() {
        let main = MainViewController()
        navigationController?.setViewControllers([main], animated: true)
    }
    
    @objc func tapFindIdButton() {
        let id = FindIdViewController()
        id.modalTransitionStyle = .coverVertical
        self.present(id, animated: true, completion: nil)
    }
    
    @objc func tapFindPasswordButton() {
        let password = FindPasswordViewController()
        password.modalPresentationStyle = .fullScreen
        self.present(password, animated: true, completion: nil)
    }
    
    @objc func tapSingnupButton() {
        let signup = SignupIdViewController()
        navigationController?.pushViewController(signup, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPasswordShownButtonImage()
        loginEmailTextField.delegate = self
        loginPasswordTextField.delegate = self
    }
    
    override func setup() {
        self.navigationItem.title = "로그인"
        self.navigationItem.backBarButtonItem = chevronBackBarButtonItem
        self.view.backgroundColor = .white
    }
    
    override func addTarget() {
        signupButton.addTarget(self, action: #selector(tapSingnupButton), for: .touchUpInside)
        resetPasswordButton.addTarget(self, action: #selector(tapFindPasswordButton), for: .touchUpInside)
        findIdButton.addTarget(self, action: #selector(tapFindIdButton), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubview(authHeaderView)
        view.addSubview(loginEmailTextField)
        view.addSubview(loginPasswordTextField)
        view.addSubview(findIdButton)
        view.addSubview(contourImageView)
        view.addSubview(resetPasswordButton)
        view.addSubview(signupQuestionLabel)
        view.addSubview(signupButton)
        view.addSubview(loginButton)
    }
    
    override func location() {
        
        loginEmailTextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(authHeaderView.snp.bottom).offset(274)
            $0.height.equalTo(52)
        }
        
        loginPasswordTextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(loginEmailTextField.snp.bottom).offset(24)
            $0.height.equalTo(52)
        }
        
        findIdButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(137)
            $0.top.equalTo(loginPasswordTextField.snp.bottom).offset(24)
        }
        
        contourImageView.snp.makeConstraints{
            $0.top.equalTo(loginPasswordTextField.snp.bottom).offset(30)
            $0.leading.equalTo(findIdButton.snp.trailing).offset(16)
            $0.height.equalTo(15)
        }
        
        resetPasswordButton.snp.makeConstraints{
            $0.leading.equalTo(contourImageView.snp.trailing).offset(16)
            $0.top.equalTo(loginPasswordTextField.snp.bottom).offset(24)
        }
        
        loginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(52)
        }
        
        signupQuestionLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(108)
            $0.bottom.equalTo(loginButton.snp.top).offset(-36)
        }
        
        signupButton.snp.makeConstraints{
            $0.leading.equalTo(signupQuestionLabel.snp.trailing).offset(8)
            $0.bottom.equalTo(loginButton.snp.top).offset(-30)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if loginEmailTextField.text?.count == 0 || loginPasswordTextField.text?.count == 0 {
            loginButton.isUserInteractionEnabled = false
        } else {
            loginButton.isUserInteractionEnabled = true
            loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
            loginButton.backgroundColor = UIColor(named: "ButtonColor")
        }
    }
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        switch textField {
        case loginEmailTextField: loginPasswordTextField.becomeFirstResponder()
        case loginPasswordTextField: loginPasswordTextField.resignFirstResponder()
        default: break
        }
        return true
    }
}
