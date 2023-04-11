import Foundation
import UIKit
import Then
import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
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
