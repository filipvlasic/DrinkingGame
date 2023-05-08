
import UIKit

class NeverHaveIEverQuestionsViewController: UIViewController {
    
    var nextQuestionButton: CustomizedButton!
    var questionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
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
        self.title = "Nikad nisam"
        view.backgroundColor = .lightGray
        questionLabel.numberOfLines = 0
        questionLabel.text = "Nikad nisam bio/bila u striptiz baru."
        nextQuestionButton.setTitle("Dalje", for: .normal)
    }

}
