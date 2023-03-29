import Foundation
import UIKit

class FindPasswordViewController: BaseViewController {
    
    let findPasswordLabel = UILabel().then{
        $0.text = "비밀번호 찾기"
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.gray
    }
    
    let findPasswordBackButton = UIButton().then{
        $0.tintColor = .black
        $0.setImage(UIImage(systemName: "multiply"), for: .normal)
        $0.addTarget(target, action: #selector(tapFindPasswordBackButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addView()
        location()
    }
    
    @objc func tapFindPasswordBackButton() {
        dismiss(animated: true, completion: nil)
    }
    
    override func setup() {
        self.view.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubview(findPasswordLabel)
        view.addSubview(findPasswordBackButton)
    }
    
    override func location() {
        findPasswordLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        findPasswordBackButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(32)
            $0.top.equalToSuperview().inset(79)
            $0.height.equalTo(28)
            $0.width.equalTo(28)
        }
    }
}
