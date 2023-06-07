
import UIKit

class TruthOrDareViewController: BaseViewController {
    
    var router: AppRouter!
    var segment: UISegmentedControl!
    var truthButton: CustomizedButton!
    var dareButton: CustomizedButton!
    var chooseLabel: UILabel!
    
    private enum Constants {
        static let segmentHeight: CGFloat = 40
    }
    
    private var dataLoaded = false {
        didSet {
            dareButton.isEnabled = true
            truthButton.isEnabled = true
        }
    }
    
    private var selectedType: String {
            questionTypes[segment.selectedSegmentIndex]
    }
    
    private var gameDescription: String = ""
    private var questions: [Task] = .init()
    private let questionTypes = ["blago", "začinjeno", "miješano"]
    
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
        truthButton = CustomizedButton()
        dareButton = CustomizedButton()
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
        
        view.addSubview(truthButton)
        
        truthButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        truthButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        truthButton.autoAlignAxis(toSuperviewAxis: .vertical)
        truthButton.autoAlignAxis(.horizontal, toSameAxisOf: view)
        truthButton.autoSetDimension(.height, toSize: 90)
        
        view.addSubview(dareButton)
        
        dareButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        dareButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        dareButton.autoPinEdge(.top, to: .bottom, of: truthButton, withOffset: 30)
        dareButton.autoSetDimension(.height, toSize: 90)
        
        if !dataLoaded {
            dareButton.isEnabled = false
            truthButton.isEnabled = false
        }
    }
    
    private func styleViews() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.89, blue: 0.79, alpha: 1.00)
        self.title = "Istina izazov"
        chooseLabel.text = "Koliko ste hrabri?"
        chooseLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        truthButton.setTitle("Istina", for: .normal)
        truthButton.backgroundColor = .systemPink
        
        dareButton.setTitle("Izazov", for: .normal)
        dareButton.backgroundColor = .systemTeal
        
        let selectedAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemOrange
        ]
        
        segment.setTitleTextAttributes(selectedAttributes, for: .selected)
        segment.selectedSegmentIndex = 0
    }
    
    private func addActions() {
        navigationItem.rightBarButtonItem?.tintColor = .brown
        navigationItem.rightBarButtonItem?.target = self
        navigationItem.rightBarButtonItem?.action = #selector(infoButtonTapped)
        truthButton.addTarget(self, action: #selector(truthDareTapped), for: .touchUpInside)
        dareButton.addTarget(self, action: #selector(truthDareTapped), for: .touchUpInside)
    }
    
    @objc private func infoButtonTapped() {
        router.showGameDetailsScreen(gameTitle: title!, gameDescription: gameDescription)
    }
    
    @objc private func truthDareTapped() {
        let filteredQuestions = filterQuestions()
        router.showTruthOrDareQuestionsScreen(with: filteredQuestions)
    }
    
    @objc private func dareDareTapped() {
        let filteredQuestions = filterQuestions()
        router.showTruthOrDareQuestionsScreen(with: filteredQuestions)
    }
    
    private func filterQuestions() -> [String] {
        let buttonType: String
        if truthButton.isTouchInside {
            buttonType = "istina"
        } else if dareButton.isTouchInside {
            buttonType = "izazov"
        } else {
            return []
        }
        
        let filteredQuestions = questions
            .filter { $0.category == buttonType && $0.type == selectedType }
            .map({ $0.question })
            .shuffled()
        
        if filteredQuestions.isEmpty {
            return questions
                .filter { $0.category == buttonType }
                .map { $0.question }
                .shuffled()
        } else {
            return filteredQuestions
        }
    }

}


extension TruthOrDareViewController {
    func configureTD(with model: IstinaIzazov) {
        gameDescription = model.gameDescription
        questions = model.questions
        dataLoaded = true
    }
}
