import Foundation
import UIKit
import Then
import SnapKit

public final class DotoriAuthHeaderView: UIView {
    
    var logoImageView = UIImageView().then{
        $0.image = UIImage(named: "Vector")
    }
    
    var logoTitleLabel = UILabel().then{
        $0.text = "Dotori"
        $0.font = UIFont.boldSystemFont(ofSize: 32)
    }
    
    var logoExplanationLabel = UILabel().then{
        $0.text = "더 편한 기숙사 생활을 위해"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .gray
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
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
