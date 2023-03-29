import UIKit

class LoginViewController: BaseViewController {
    
    let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "Vector")
    }
    
    let titleLabel = UILabel().then{
        $0.text = "Dotori"
        $0.font = UIFont.boldSystemFont(ofSize: 32)
    }
    
    let explanationLabel = UILabel().then{
        $0.text = "더 편한 기숙사 생활을 위해"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .gray
    }
    
    let loginEmailTextField = UITextField().then{
        $0.placeholder = "아이디"
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.leftPadding()
    }
    
    let loginPasswordTextField = UITextField().then{
        $0.placeholder = "비밀번호"
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.leftPadding()
    }
    
    let findIdButton = UIButton().then{
        $0.setTitle("아이디찾기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.addTarget(target, action: #selector(tapFindIdButton), for: .touchUpInside)
    }
    
    let contourImageView = UIImageView().then{
        $0.image = UIImage(named: "Line 3")
    }
    
    let resetPasswordButton = UIButton().then{
        $0.setTitle("비밀번호재설정", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        $0.addTarget(target, action: #selector(tapFindPasswordButton), for: .touchUpInside)
    }
    
    let signupQuestionLabel = UILabel().then{
        $0.text = "아직 회원이 아니신가요?"
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    let signupButton = UIButton().then{
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.addTarget(target, action: #selector(tapSingnupButton), for: .touchUpInside)
    }
    
    let loginButton = UIButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0x6F7AEC)
        $0.layer.cornerRadius = 8
        $0.addTarget(target, action: #selector(tapLoginButton), for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addView()
        location()
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
        let signup = SignupViewController()
        navigationController?.pushViewController(signup, animated: true)
    }
    
    override func setup() {
        self.navigationItem.title = "로그인"
        self.view.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(explanationLabel)
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
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(logoImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().inset(131)
        }
        
        logoImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(121)
            $0.width.height.equalTo(48)
        }
        
        explanationLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        loginEmailTextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(explanationLabel.snp.bottom).offset(54)
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
        
        signupQuestionLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(108)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(112)
        }
        
        signupButton.snp.makeConstraints{
            $0.leading.equalTo(signupQuestionLabel.snp.trailing).offset(8)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(106)
        }
        
        loginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(52)
        }
    }
}

