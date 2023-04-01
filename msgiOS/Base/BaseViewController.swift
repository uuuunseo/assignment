import Foundation
import UIKit
import Then
import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        setup()
        addView()
        location()
        addTarget()
    }
    
    func setup(){}
    func addView(){}
    func location(){}
    func addTarget(){}
}
