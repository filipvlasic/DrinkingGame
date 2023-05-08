
import UIKit

class GamesListViewController: UIViewController {
    
    var router: AppRouter!
    private var truthOrDareButton: CutomizedButton!
    private var neverHaveIEverButton: CutomizedButton!
    private var trecaIgra: CutomizedButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        addActions()
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
        truthOrDareButton = CutomizedButton()
        neverHaveIEverButton = CutomizedButton()
        trecaIgra = CutomizedButton()
    }
    
    private func layoutViews() {
        view.addSubview(truthOrDareButton)
        
        truthOrDareButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        truthOrDareButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        truthOrDareButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: 140)
        truthOrDareButton.autoSetDimension(.height, toSize: 80)
        
        view.addSubview(neverHaveIEverButton)
        
        neverHaveIEverButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        neverHaveIEverButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        neverHaveIEverButton.autoPinEdge(.top, to: .bottom, of: truthOrDareButton, withOffset: 76)
        neverHaveIEverButton.autoSetDimension(.height, toSize: 80)
        
        view.addSubview(trecaIgra)
        
        trecaIgra.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        trecaIgra.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        trecaIgra.autoPinEdge(.top, to: .bottom, of: neverHaveIEverButton, withOffset: 76)
        trecaIgra.autoSetDimension(.height, toSize: 80)
    }
    
    private func styleViews() {
        self.title = "Popis Igara"
        view.backgroundColor = .lightGray
        truthOrDareButton.setTitle("Istina izazov", for: .normal)
        neverHaveIEverButton.setTitle("Nikad nisam", for: .normal)
        trecaIgra.setTitle("Treca igra", for: .normal)
    }
    
    private func addActions() {
        neverHaveIEverButton.addTarget(self, action: #selector(neverHaveIEverButtonAction), for: .touchUpInside)
        trecaIgra.addTarget(self, action: #selector(igra3ButtonAction), for: .touchUpInside)
        truthOrDareButton.addTarget(self, action: #selector(truthOrDareButtonAction), for: .touchUpInside)
    }
    
    @objc func neverHaveIEverButtonAction(sender: UIButton!) {
        router.showNeverHaveIEverScreen()
    }
    
    @objc func igra3ButtonAction(sender: UIButton!) {
        router.showIgra3Screen()
    }
    
    @objc func truthOrDareButtonAction(sender: UIButton!) {
        router.showTruthOrDareScreen()
    }
    
    
}
