
import UIKit

class GamesListViewController: BaseViewController {
    
    private enum Constants {
        static let delay: CGFloat = 0
    }
    
//    private let apiClient: APIClient = MockAPIClient()
    private let apiClient: APIClient = ApiaryAPIClient()
    
    var router: AppRouter!
    private var neverHaveIEverButton: CustomizedButton!
    private var segeSaleButton: CustomizedButton!

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
        neverHaveIEverButton = CustomizedButton()
        segeSaleButton = CustomizedButton()
    }
    
    private func layoutViews() {
        
        view.addSubview(neverHaveIEverButton)
        neverHaveIEverButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        neverHaveIEverButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        neverHaveIEverButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: 140)
        neverHaveIEverButton.autoSetDimension(.height, toSize: 80)
        
        view.addSubview(segeSaleButton)
        segeSaleButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        segeSaleButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        segeSaleButton.autoPinEdge(.top, to: .bottom, of: neverHaveIEverButton, withOffset: 76)
        segeSaleButton.autoSetDimension(.height, toSize: 80)
    }
    
    private func styleViews() {
        self.title = "Popis Igara"
        view.backgroundColor = UIColor(red: 0.96, green: 0.89, blue: 0.79, alpha: 1.00)
        
        neverHaveIEverButton.setTitle("Nikad nisam", for: .normal)
        neverHaveIEverButton.backgroundColor = .systemMint
        
        segeSaleButton.setTitle("Šege šale", for: .normal)
        segeSaleButton.backgroundColor = .systemPurple
    }
    
    private func addActions() {
        neverHaveIEverButton.addTarget(self, action: #selector(neverHaveIEverButtonAction), for: .touchUpInside)
        segeSaleButton.addTarget(self, action: #selector(segeSaleButtonAction), for: .touchUpInside)
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
    
    @objc func segeSaleButtonAction(sender: UIButton!) {
        router.showSegeSaleScreen()
    }
    
}
