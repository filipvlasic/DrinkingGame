import UIKit

class BaseViewController: UIViewController {
    
    var rightBarButtonItem = UIBarButtonItem(
        image: .rightBarButtonImage,
        style: .plain,
        target: nil,
        action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: .leftBarButtonImage,
            style: .done,
            target: self,
            action: #selector(back))
    }
    
    @objc
    private func back() {
        navigationController?.popViewController(animated: true)
    }
}
