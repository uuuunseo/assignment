import UIKit

public final class DotoriButton: UIButton {
        
    public init(setTitle: String) {
        super.init(frame: .zero)
        
        setup()
        self.setTitle(setTitle, for: .normal)
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
