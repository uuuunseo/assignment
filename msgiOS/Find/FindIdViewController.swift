import UIKit

class FindIdViewController: BaseViewController{
    
    private let findIdLabel = UILabel().then{
        $0.text = "아이디 찾기"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    private let findIdBackButton = UIButton().then{
        $0.tintColor = .black
        $0.setImage(UIImage(systemName: "multiply"), for: .normal)
    }
    
    override func addTarget() {
        findIdBackButton.addTarget(self, action: #selector(tapFindIdButton), for: .touchUpInside)
    }
    
    @objc func tapFindIdButton() {
            dismiss(animated: true, completion: nil)
    }
    
    override func setup() {
        self.view.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubview(findIdLabel)
        view.addSubview(findIdBackButton)
    }
    
    override func location() {
        findIdLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        findIdBackButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(32)
            $0.top.equalToSuperview().inset(32)
            $0.height.equalTo(28)
            $0.width.equalTo(28)
        }
    }
}
