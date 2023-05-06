
import UIKit

class GamesListViewController: UIViewController {
    
    var router: AppRouter!
    private var truthOrDareButton: UIButton!
    private var neverHaveIEverButton: UIButton!
    private var trecaIgra: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        styleViews()
    }
    
    init(router: AppRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        truthOrDareButton = UIButton()
        neverHaveIEverButton = UIButton()
        trecaIgra = UIButton()
    }
    
    private func layoutViews() {
        view.addSubview(truthOrDareButton)
        
        view.addSubview(neverHaveIEverButton)
        
        view.addSubview(trecaIgra)
    }
    
    private func styleViews() {
        self.title = "Popis Igara"
        view.backgroundColor = .lightGray
    }
    
    
}
