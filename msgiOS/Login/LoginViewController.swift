import UIKit

final class LoginViewController: BaseViewController {
    // MARK: - Properties
    private let chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: LoginViewController.self, action: nil).then{
        $0.tintColor = .black
    }
    
    private let loginEmailTextField = DotoriTextField(placeholder: "아이디")
    private let loginPasswordTextField = DotoriPasswordTextField(placeholder: "비밀번호")
    private let authHeaderView = DotoriAuthHeaderView(text: "더 편한 기숙사 생활을 위해")
    
    private let contourView = UIView().then{
        $0.backgroundColor = .gray
    }
    
    private let findIdButton = UIButton().then{
        $0.setTitle("아이디찾기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let resetPasswordButton = UIButton().then{
        $0.setTitle("비밀번호재설정", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let signupButton = UIButton().then{
        $0.setTitle("아직 회원이 아니신가요?   회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    private let loginButton = UIButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .gray
        $0.layer.cornerRadius = 8
    }
    
    // MARK: - Functions
    @objc func tapLoginButton() {
        let mainVC = MainViewController()
        navigationController?.setViewControllers([mainVC], animated: true)
    }
    
    @objc func tapFindIdButton() {
        let idVC = FindIdViewController()
        idVC.modalTransitionStyle = .coverVertical
        self.present(idVC, animated: true, completion: nil)
    }
    
    @objc func tapFindPasswordButton() {
        let passwordVC = FindPasswordViewController()
        passwordVC.modalPresentationStyle = .fullScreen
        self.present(passwordVC, animated: true, completion: nil)
    }
    
    @objc func tapSingnupButton() {
        let signupVC = SignupIdViewController()
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    override func addTarget() {
        signupButton.addTarget(self, action: #selector(tapSingnupButton), for: .touchUpInside)
        resetPasswordButton.addTarget(self, action: #selector(tapFindPasswordButton), for: .touchUpInside)
        findIdButton.addTarget(self, action: #selector(tapFindIdButton), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginEmailTextField.delegate = self
        loginPasswordTextField.delegate = self
    }
    
    // MARK: - UI
    override func setup() {
        self.navigationItem.title = "로그인"
        self.navigationItem.backBarButtonItem = chevronBackBarButtonItem
    }
    
    override func addView() {
        view.addSubviews(authHeaderView, loginEmailTextField, loginPasswordTextField, findIdButton, contourView, resetPasswordButton, signupButton, loginButton)
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
        
        contourView.snp.makeConstraints{
            $0.top.equalTo(loginPasswordTextField.snp.bottom).offset(30)
            $0.leading.equalTo(findIdButton.snp.trailing).offset(16)
            $0.height.equalTo(13)
            $0.width.equalTo(1)
        }
        
        resetPasswordButton.snp.makeConstraints{
            $0.leading.equalTo(contourView.snp.trailing).offset(16)
            $0.top.equalTo(loginPasswordTextField.snp.bottom).offset(24)
        }
        
        loginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(52)
        }
        
        signupButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(108)
            $0.bottom.equalTo(loginButton.snp.top).offset(-30)
        }
    }
}

// MARK: - extension
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if loginEmailTextField.text?.count == 0 || loginPasswordTextField.text?.count == 0 {
            loginButton.isUserInteractionEnabled = false
        } else {
            loginButton.isUserInteractionEnabled = true
            loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
            loginButton.backgroundColor = .buttonColor
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
