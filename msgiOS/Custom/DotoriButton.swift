import Foundation
import UIKit

public final class DotoriButton: UIButton {
        
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    func setup(){
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        backgroundColor = .gray
        layer.cornerRadius = 8
    }
}
