
import UIKit

class NeverHaveIEverViewController: BaseViewController {
    
    private enum Constants {
        static let segmentHeight: CGFloat = 40
    }
    
    private var dataLoaded = false {
        didSet {
            startButton.isEnabled = true
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
    
    private var selectedType: String {
        questionTypes[segment.selectedSegmentIndex]
    }
    
    private var gameDescription: String = ""
    private var questions: [Question] = .init()
    private let questionTypes = ["blaga", "začinjena", "miješana"]
    
    var router: AppRouter!
    var segment: UISegmentedControl!
    var startButton: CustomizedButton!
    var chooseLabel: UILabel!
    
    init(router: AppRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        
        buildViews()
        addActions()
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
        let items = questionTypes.map { $0.capitalized }
        segment = UISegmentedControl(items: items)
        startButton = CustomizedButton()
        chooseLabel = UILabel()
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func layoutViews() {
        view.addSubview(chooseLabel)
        
        chooseLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        chooseLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 50)
        
        view.addSubview(segment)
        
        segment.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        segment.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        segment.autoPinEdge(.top, to: .bottom, of: chooseLabel, withOffset: 20)
        segment.autoSetDimension(.height, toSize: Constants.segmentHeight)
        
        view.addSubview(startButton)
        
        startButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        startButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        startButton.autoPinEdge(.top, to: .bottom, of: segment, withOffset: 90)
        startButton.autoSetDimension(.height, toSize: 60)
        
        if !dataLoaded {
            startButton.isEnabled = false
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    private func styleViews() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.89, blue: 0.79, alpha: 1.00)
        title = "Nikad nisam"
        
        chooseLabel.text = "Koliko ste hrabri?"
        chooseLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemMint], for: .selected)
        segment.selectedSegmentIndex = 0
        
        startButton.setTitle("Krenimo!", for: .normal)
        startButton.backgroundColor = .systemMint
    }
    
    private func addActions() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem?.target = self
        navigationItem.rightBarButtonItem?.action = #selector(infoButtonTapped)
    }
    
    @objc private func infoButtonTapped() {
        router.showGameDetailsScreen(gameTitle: title!, gameDescription: gameDescription)
    }
    
    @objc private func startButtonTapped() {
        let filteredQuestions = filterQuestions()
        router.showNeverHaveIEverQuestionsScreen(with: filteredQuestions)
    }
    
    private func filterQuestions() -> [String] {
        let filteredQuestions = questions
            .filter { $0.type == selectedType }
            .map({ $0.question })
            .shuffled()
        if filteredQuestions.isEmpty {
            return questions
                .map { $0.question }
                .shuffled()
        } else {
            return filteredQuestions
        }
    }
}

extension NeverHaveIEverViewController {
    func configure(with model: NikadNisam) {
        gameDescription = model.gameDescription
        questions = model.questions
        dataLoaded = true
    }
}
