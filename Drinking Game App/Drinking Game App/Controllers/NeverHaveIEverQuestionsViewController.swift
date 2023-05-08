
import UIKit

class NeverHaveIEverQuestionsViewController: UIViewController {
    
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
        self.title = "Nikad nisam"
        view.backgroundColor = .lightGray
        questionLabel.numberOfLines = 0
        questionLabel.text = questions[0]
        questionLabel.textAlignment = .center
        questionLabel.font = .systemFont(ofSize: 24, weight: .bold)

        nextQuestionButton.setTitle("Sljedeće", for: .normal)
        
        previousQuestionButton.setTitle("Prethodno", for: .normal)
        previousQuestionButton.isEnabled = false
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 100
    }
    
    private func addActions() {
        previousQuestionButton.addTarget(self, action: #selector(previousQuestion), for: .touchUpInside)
        nextQuestionButton.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)

    }
    
    @objc
    private func previousQuestion() {
        if index > 0 {
            index -= 1
//            questionLabel.text = questions[index % questions.count]
            animateQuestionLabel()
        }
    }
    
    @objc
    private func nextQuestion() {
        index += 1
        animateQuestionLabel()

    }
    
    private func animateQuestionLabel() {
        UIView.animate(withDuration: 0.2) {
            self.questionLabel.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.questionLabel.text = self.questions[self.index]
                self.questionLabel.alpha = 1
            }
        }
    }

}
