import UIKit

class SignupCompleteViewController: BaseViewController {
    
    lazy var chevronBackBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil).then{
        $0.tintColor = .black
    }
    
    var goLoginButton = DotoriButton().then{
        $0.setTitle("로그인 하러가기", for: .normal)
        $0.backgroundColor = UIColor(named: "ButtonColor")
    }
    
    private let completeTitleLabel = UILabel().then{
        $0.text = "완료"
        $0.font = UIFont.boldSystemFont(ofSize: 32)
    }
    
    private let completeSubTitleLabel = UILabel().then{
        $0.text = "회원가입이 완료되었습니다 \n 로그인을 이어서 진행해주세요!"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    
    @objc func tapGoLoginButton() {
        let login = LoginViewController()
        navigationController?.pushViewController(login, animated: true)
    }
    
    override func setup() {
        self.navigationItem.title = "회원가입"
        self.navigationItem.backBarButtonItem = chevronBackBarButtonItem
    }
    
    override func addView() {
        view.addSubview(goLoginButton)
        view.addSubview(completeTitleLabel)
        view.addSubview(completeSubTitleLabel)
    }
    
    override func addTarget() {
        goLoginButton.addTarget(self, action: #selector(tapGoLoginButton), for: .touchUpInside)
    }
    
    override func location() {
        goLoginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(52)
        }
        
        completeSubTitleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        completeTitleLabel.snp.makeConstraints{
            $0.bottom.equalTo(completeSubTitleLabel.snp.top).inset(-30)
            $0.centerX.equalToSuperview()
        }
    }
}
