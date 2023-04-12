import UIKit

final class SignupIdViewController: BaseViewController {
    // MARK: - Properties
    private let chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: SignupIdViewController.self, action: nil).then{
        $0.tintColor = .black
    }
    
    private let authHeader = DotoriAuthHeaderView(text: "사용하실 아이디를 입력해주세요")
    private let signupIdTextfield = DotoriTextField(placeholder: "아이디")
    private let nextButton = DotoriButton(setTitle: "다음")
    
    private let signupIdRequirements = UILabel().then{
        $0.text = "아이디는 최소 4자에서 최대 20자까지 가능합니다."
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    // MARK: - Functions
    @objc func tapNextButton() {
        let passwordVC = SignupPasswordViewController()
        navigationController?.pushViewController(passwordVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupIdTextfield.delegate = self
    }
    
    // MARK: - UI
    override func setup() {
        self.navigationItem.title = "회원가입"
        self.navigationItem.backBarButtonItem = chevronBackBarButtonItem
    }
    
    override func addView() {
        view.addSubviews(authHeader, signupIdRequirements, signupIdTextfield, nextButton)
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
}

// MARK: - extension
extension SignupIdViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let count = signupIdTextfield.text?.count, count >= 4 && count <= 20 {
            nextButton.backgroundColor = .buttonColor
            nextButton.isUserInteractionEnabled = true
            nextButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        } else {
            nextButton.backgroundColor = .gray
            nextButton.isUserInteractionEnabled = false
        }
    }
}
