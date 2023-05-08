
import UIKit

class GameDetailsViewController: UIViewController {
    
    private var gameDescriptionLabel: UILabel!

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
        gameDescriptionLabel = UILabel()
    }
    
    private func layoutViews() {
        view.addSubview(gameDescriptionLabel)
        gameDescriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        gameDescriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        gameDescriptionLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 30)
        gameDescriptionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30, relation: .greaterThanOrEqual)
    }
    
    private func styleViews() {
        view.backgroundColor = .lightGray
        gameDescriptionLabel.text = "Truth or dare is a fun game to play with your friends, especially at sleepovers and during other times when you probably won’t be disturbed by siblings, parents, or pets. While things might get weird and sometimes uncomfortable, truth or dare is often really funny as well."
        gameDescriptionLabel.textColor = .black
        gameDescriptionLabel.layer.borderColor = UIColor.blue.cgColor
        gameDescriptionLabel.layer.borderWidth = 1.0
        gameDescriptionLabel.layer.cornerRadius = 5.0
        gameDescriptionLabel.numberOfLines = 0
    }

}
