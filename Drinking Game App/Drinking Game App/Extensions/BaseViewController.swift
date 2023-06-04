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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationItem.rightBarButtonItem?.tintColor = .brown
        navigationItem.leftBarButtonItem?.tintColor = .brown
    }
    
    @objc
    private func back() {
        navigationController?.popViewController(animated: true)
    }
}
