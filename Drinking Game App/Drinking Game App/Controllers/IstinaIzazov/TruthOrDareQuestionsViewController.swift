
import UIKit

class TruthOrDareQuestionsViewController: BaseViewController {
    
    var router: AppRouter!
    var nextQuestionButton: CustomizedButton!
    var questionLabel: UILabel!
    private let questions: [String]

    private enum Constants {
        static let questionSize: CGFloat = 36
        static let animationDuration: CGFloat = 0.2
        static let buttonSpacing: CGFloat = 100
    }
    private var index: Int = 0 {
        didSet {
            nextQuestionButton.isEnabled = index != (questions.count - 1)
        }
    }
    
    init(router: AppRouter, questions: [String]) {
        self.questions = questions
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        addActions()
    }
    
    private func buildViews() {
        createViews()
        layoutViews()
        styleViews()
    }
    
    private func createViews() {
        nextQuestionButton = CustomizedButton()
        questionLabel = UILabel()
    }
    
    private func layoutViews() {
        view.addSubview(questionLabel)
        
        questionLabel.autoCenterInSuperview()
        questionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        questionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        
        view.addSubview(nextQuestionButton)
        
        nextQuestionButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 240)
        nextQuestionButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        nextQuestionButton.autoPinEdge(toSuperviewEdge: .top, withInset: 700)
        nextQuestionButton.autoSetDimension(.height, toSize: 50)
    }
    
    private func styleViews() {
        self.title = "Istina izazov"
        
        view.backgroundColor = UIColor(red: 0.96, green: 0.89, blue: 0.79, alpha: 1.00)
        questionLabel.numberOfLines = 0
        questionLabel.text = questions[0]
        questionLabel.textAlignment = .center
        questionLabel.font = .systemFont(ofSize: Constants.questionSize, weight: .bold)
        
        nextQuestionButton.setTitle("Dalje", for: .normal)
        nextQuestionButton.backgroundColor = .systemOrange
    }
    
    private func addActions() {
        nextQuestionButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }
    
    @objc private func nextTapped() {
        index += 1
        router.popQuestionsScreen()
    }
    
    
}
