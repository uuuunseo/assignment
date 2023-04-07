import Foundation
import UIKit
import Then
import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        setup()
        addTarget()
        addView()
        location()
    }
    
    func setup(){}
    func addTarget(){}
    func addView(){}
    func location(){}
}
