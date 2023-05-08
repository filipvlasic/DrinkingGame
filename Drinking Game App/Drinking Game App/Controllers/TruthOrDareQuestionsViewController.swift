
import UIKit

class TruthOrDareQuestionsViewController: UIViewController {
    
    var router: AppRouter!
    var nextQuestionButton: CustomizedButton!
    var questionLabel: UILabel!

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
        nextQuestionButton = CustomizedButton()
        questionLabel = UILabel()
    }
    
    private func layoutViews() {
        view.addSubview(questionLabel)
        
        questionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 40)
        questionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 40)
        questionLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 100)
        questionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 150, relation: .greaterThanOrEqual)
        
        view.addSubview(nextQuestionButton)
        
        nextQuestionButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 240)
        nextQuestionButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        nextQuestionButton.autoPinEdge(toSuperviewEdge: .top, withInset: 700)
        nextQuestionButton.autoSetDimension(.height, toSize: 50)
    }
    
    private func styleViews() {
        self.title = "Istina izazov"
        view.backgroundColor = .lightGray
        questionLabel.numberOfLines = 0
        questionLabel.text = "Koji ti je najdrazi film?"
        nextQuestionButton.setTitle("Dalje", for: .normal)
    }
    
    private func addActions() {
        nextQuestionButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }
    
    @objc private func nextTapped() {
        router.popQuestionsScreen()
    }

}
