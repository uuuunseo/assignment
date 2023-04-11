import UIKit
import Then
import SnapKit

public final class DotoriAuthHeaderView: UIView {
    
    let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "Vector")
    }
    
    let logoTitleLabel = UILabel().then{
        $0.text = "Dotori"
        $0.font = UIFont.boldSystemFont(ofSize: 32)
    }
    
    let logoExplanationLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .gray
    }
    
    public init(text: String) {
        super.init(frame: .zero)
        self.logoExplanationLabel.text = text
        
        setup()
    }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
    }
    
    func setup() {
        addSubview(logoImageView)
        addSubview(logoTitleLabel)
        addSubview(logoExplanationLabel)
        
        logoImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(121)
            $0.width.height.equalTo(48)
        }
        
        logoTitleLabel.snp.makeConstraints{
            $0.leading.equalTo(logoImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().inset(131)
        }
        
        logoExplanationLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalTo(logoTitleLabel.snp.bottom).offset(20)
        }
    }
}
