import UIKit

public final class DotoriPasswordTextField: UITextField {
    
    var passwordEyeButton = UIButton(type: .custom)
    
    public init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        
        setup()
        passwordShownButtonImage()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
        passwordShownButtonImage()
    }
    
    func setup(){
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        leftPadding()
        isSecureTextEntry = true
    }
    
    func passwordShownButtonImage() {
        passwordEyeButton = UIButton.init(primaryAction: UIAction(handler: { [weak self]_ in
            self?.isSecureTextEntry.toggle()
            self?.passwordEyeButton.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        passwordEyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordEyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordEyeButton.configuration = buttonConfiguration
        passwordEyeButton.tintColor = .gray
        
        self.rightView = passwordEyeButton
        self.rightViewMode = .always
    }
}
