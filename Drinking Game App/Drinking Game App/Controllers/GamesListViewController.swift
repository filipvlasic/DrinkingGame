
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
    private var segesaleButton: CustomizedButton!

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
        segesaleButton = CustomizedButton()
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
        
        view.addSubview(segesaleButton)
        
        segesaleButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        segesaleButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        segesaleButton.autoPinEdge(.top, to: .bottom, of: neverHaveIEverButton, withOffset: 76)
        segesaleButton.autoSetDimension(.height, toSize: 80)
    }
    
    private func styleViews() {
        self.title = "Popis Igara"
        view.backgroundColor = UIColor(red: 0.96, green: 0.89, blue: 0.79, alpha: 1.00)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "xmark.circle"),
//            style: .done,
//            target: self,
//            action: #selector(back))
        
        truthOrDareButton.setTitle("Istina izazov", for: .normal)
        truthOrDareButton.backgroundColor = .systemOrange
        neverHaveIEverButton.setTitle("Nikad nisam", for: .normal)
        neverHaveIEverButton.backgroundColor = .systemMint
        segesaleButton.setTitle("Šege šale", for: .normal)
        segesaleButton.backgroundColor = .systemPurple
        
    }
    
    private func addActions() {
        neverHaveIEverButton.addTarget(self, action: #selector(neverHaveIEverButtonAction), for: .touchUpInside)
        segesaleButton.addTarget(self, action: #selector(segesaleButtonAction), for: .touchUpInside)
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
    
    private func fetchTruthOrDareData(completion: @escaping (IstinaIzazov) -> Void) {
        apiClient.getTruthOrDareData { amIstinaIzazov in
            guard let amIstinaIzazov = amIstinaIzazov else { return }
            let questions: [Task] = amIstinaIzazov.questions.compactMap { question in
                return Task(category: question.category, type: question.type, question: question.question)
            }
            let istinaIzazov = IstinaIzazov(
                gameTitle: amIstinaIzazov.gameTitle,
                gameDescription: amIstinaIzazov.gameDescription,
                questions: questions)
            
            completion(istinaIzazov)
        }
    }
    @objc func neverHaveIEverButtonAction(sender: UIButton!) {
        let neverHaveIEverViewController = router.showNeverHaveIEverScreen()
        fetchNeverHaveIEverData { nikadNisam in
            neverHaveIEverViewController.configure(with: nikadNisam)
        }
    }
    
    @objc func segesaleButtonAction(sender: UIButton!) {
        router.showSegeSaleScreen()
    }
    
    @objc func truthOrDareButtonAction(sender: UIButton!) {
        let truthOrDareViewController = router.showTruthOrDareScreen()
        fetchTruthOrDareData { istinaIzazov in
            truthOrDareViewController.configureTD(with: istinaIzazov)
        }
    }
    
}
