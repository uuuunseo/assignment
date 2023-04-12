import UIKit

public final class DotoriTextField: UITextField {
    
    public init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    func setup(){
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        leftPadding()
    }
}
