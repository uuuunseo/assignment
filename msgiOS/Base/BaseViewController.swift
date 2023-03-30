import Foundation
import UIKit
import Then
import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        setup()
        addView()
        location()
    }
    
    func setup(){}
    func addView(){}
    func location(){}
}
