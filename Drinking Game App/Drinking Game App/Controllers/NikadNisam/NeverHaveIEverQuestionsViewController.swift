
import UIKit

class NeverHaveIEverQuestionsViewController: BaseViewController {
    
    private enum Constants {
        static let questionSize: CGFloat = 36
        static let animationDuration: CGFloat = 0.2
        static let buttonSpacing: CGFloat = 100
    }
    
    private let questions: [String]
    
    var questionLabel: UILabel!
    var stackView: UIStackView!
    var previousQuestionButton: CustomizedButton!
    var nextQuestionButton: CustomizedButton!
    private var index: Int = 0 {
        didSet {
            previousQuestionButton.isEnabled = index != 0
            nextQuestionButton.isEnabled = index != (questions.count - 1)
        }
    }
    
    init(questions: [String]) {
        self.questions = questions
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
        stackView = UIStackView()
        nextQuestionButton = CustomizedButton()
        previousQuestionButton = CustomizedButton()
        questionLabel = UILabel()
    }
    
    private func layoutViews() {
        view.addSubview(questionLabel)
        stackView.addArrangedSubview(previousQuestionButton)
        stackView.addArrangedSubview(nextQuestionButton)
        view.addSubview(stackView)
        questionLabel.autoCenterInSuperview()
        questionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        questionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        questionLabel.autoPinEdge(.bottom, to: .top, of: stackView, withOffset: -16, relation: .greaterThanOrEqual)
        
        
        stackView.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: 16)
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        stackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        stackView.autoSetDimension(.height, toSize: 60)
    }
    
    private func styleViews() {
        self.title = "Pitanja"
        view.backgroundColor = UIColor(red: 0.96, green: 0.89, blue: 0.79, alpha: 1.00)
        questionLabel.numberOfLines = 0
        questionLabel.text = questions[0]
        questionLabel.textAlignment = .center
        questionLabel.font = .systemFont(ofSize: Constants.questionSize, weight: .bold)

        nextQuestionButton.setTitle("Sljedeće", for: .normal)
        nextQuestionButton.backgroundColor = .systemMint
        
        previousQuestionButton.setTitle("Prethodno", for: .normal)
        previousQuestionButton.isEnabled = false
        previousQuestionButton.backgroundColor = .systemMint
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.buttonSpacing
    }
    
    private func addActions() {
        previousQuestionButton.addTarget(self, action: #selector(previousQuestion), for: .touchUpInside)
        nextQuestionButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)

    }
    
    @objc
    private func previousQuestion() {
        if index > 0 {
            index -= 1
            animateQuestionLabel()
        }
    }
    
    @objc
    private func nextQuestion() {
        index += 1
        animateQuestionLabel()

    }
    
    private func animateQuestionLabel() {
        UIView.animate(withDuration: Constants.animationDuration) {
            self.questionLabel.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: Constants.animationDuration) {
                self.questionLabel.text = self.questions[self.index]
                self.questionLabel.alpha = 1
            }
        }
    }

}
