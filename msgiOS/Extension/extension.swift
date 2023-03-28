import Foundation
import UIKit

extension UITextField {
    func leftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = ViewMode.always
    }
}
