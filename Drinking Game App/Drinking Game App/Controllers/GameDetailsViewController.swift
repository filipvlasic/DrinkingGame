
import UIKit

class GameDetailsViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

    init(gameTitle: String, gameDescription: String) {
        titleLabel.text = gameTitle
        descriptionLabel.text = gameDescription
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

    }
    
    private func layoutViews() {
        view.addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 30, left: 16, bottom: 0, right: 16), excludingEdge: .bottom)
        
        view.addSubview(descriptionLabel)
        descriptionLabel.autoAlignAxis(toSuperviewAxis: .horizontal) // Center horizontally
        descriptionLabel.autoAlignAxis(toSuperviewAxis: .vertical) // Center vertically
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 20)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30, relation: .greaterThanOrEqual)
    }

    
    private func styleViews() {
        view.backgroundColor = UIColor(red: 0.86, green: 0.79, blue: 0.69, alpha: 1.0)
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 36, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        descriptionLabel.textColor = .black
        descriptionLabel.layer.backgroundColor = UIColor(red: 0.69, green: 0.61, blue: 0.49, alpha: 1.0).cgColor
        descriptionLabel.layer.cornerRadius = 5.0
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
    }

}
