
import UIKit

class Igra3ViewController: UIViewController {
    
    var router: AppRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    
    init(router: AppRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        createViews()
        layoutViews()
        styleViews()
    }
    
    private func createViews() {
        
    }
    
    private func layoutViews() {
        
    }
    
    private func styleViews() {
        view.backgroundColor = .lightGray
        self.title = "Treca igra"
    }

}
