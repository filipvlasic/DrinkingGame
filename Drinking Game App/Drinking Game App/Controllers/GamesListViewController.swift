
import UIKit

class GamesListViewController: BaseViewController {
    
    private enum Constants {
        static let delay: CGFloat = 0
    }
    
//    private let apiClient: APIClient = MockAPIClient()
    private let apiClient: APIClient = ApiaryAPIClient()
    
    var router: AppRouter!
    private var truthOrDareButton: CustomizedButton!
    private var neverHaveIEverButton: CustomizedButton!
    private var trecaIgra: CustomizedButton!

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
        truthOrDareButton = CustomizedButton()
        neverHaveIEverButton = CustomizedButton()
        trecaIgra = CustomizedButton()
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
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "xmark.circle"),
//            style: .done,
//            target: self,
//            action: #selector(back))
        
        truthOrDareButton.setTitle("Istina izazov", for: .normal)
        
        neverHaveIEverButton.setTitle("Nikad nisam", for: .normal)
        
        trecaIgra.setTitle("Treca igra", for: .normal)
    }
    
    private func addActions() {
        neverHaveIEverButton.addTarget(self, action: #selector(neverHaveIEverButtonAction), for: .touchUpInside)
        trecaIgra.addTarget(self, action: #selector(igra3ButtonAction), for: .touchUpInside)
        truthOrDareButton.addTarget(self, action: #selector(truthOrDareButtonAction), for: .touchUpInside)
    }
    
    private func fetchNeverHaveIEverData(completion: @escaping (NikadNisam) -> Void) {
        apiClient.getNeverHaveIEverData { amNikadNisam in
            guard let amNikadNisam else { return }
            let questions: [Question] = amNikadNisam.questions.compactMap { question in
                return Question(type: question.type, question: question.question)
            }
            let nikadNisam = NikadNisam(
                gameTitle: amNikadNisam.gameTitle,
                gameDescription: amNikadNisam.gameDescription,
                questions: questions)
            
            completion(nikadNisam)
        }
    }
    
    @objc func neverHaveIEverButtonAction(sender: UIButton!) {
        let neverHaveIEverViewController = router.showNeverHaveIEverScreen()
        fetchNeverHaveIEverData { nikadNisam in
            neverHaveIEverViewController.configure(with: nikadNisam)
        }
    }
    
    @objc func igra3ButtonAction(sender: UIButton!) {
        router.showIgra3Screen()
    }
    
    @objc func truthOrDareButtonAction(sender: UIButton!) {
        router.showTruthOrDareScreen()
    }
    
    
}
