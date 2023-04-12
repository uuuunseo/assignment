import UIKit

final class FindIdViewController: BaseViewController{
    // MARK: - Properties
    private let findIdLabel = UILabel().then{
        $0.text = "아이디 찾기"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    private let findIdBackButton = UIButton().then{
        $0.tintColor = .black
        $0.setImage(UIImage(systemName: "multiply"), for: .normal)
    }
    
    // MARK: - Functions
    override func addTarget() {
        findIdBackButton.addTarget(self, action: #selector(tapFindIdButton), for: .touchUpInside)
    }
    
    @objc func tapFindIdButton() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubviews(findIdLabel, findIdBackButton)
    }
    
    override func location() {
        findIdLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        findIdBackButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(32)
            $0.top.equalToSuperview().inset(32)
            $0.size.equalTo(28)
        }
    }
}
