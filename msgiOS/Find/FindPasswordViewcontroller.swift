import UIKit

final class FindPasswordViewController: BaseViewController {
    // MARK: - Properties
    private let findPasswordLabel = UILabel().then{
        $0.text = "비밀번호 찾기"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    private let findPasswordBackButton = UIButton().then{
        $0.tintColor = .black
        $0.setImage(UIImage(systemName: "multiply"), for: .normal)
    }
    
    // MARK: - Functions
    override func addTarget() {
        findPasswordBackButton.addTarget(self, action: #selector(tapFindPasswordBackButton), for: .touchUpInside)
    }
    
    @objc func tapFindPasswordBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubviews(findPasswordLabel, findPasswordBackButton)
    }
    
    override func location() {
        findPasswordLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        findPasswordBackButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(32)
            $0.top.equalToSuperview().inset(79)
            $0.size.equalTo(28)
        }
    }
}
