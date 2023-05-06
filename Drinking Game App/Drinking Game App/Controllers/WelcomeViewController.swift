
import UIKit
import PureLayout

class WelcomeViewController: UIViewController {
    
    var router: AppRouter!
    private var welcomeButton = UIButton()
    private var welcomeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
        styleViews()
        
    }
    
    init(router: AppRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        view.addSubview(welcomeLabel)
        welcomeLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        welcomeLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        welcomeLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 40)
        
        view.addSubview(welcomeButton)
        welcomeButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        welcomeButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        welcomeButton.autoPinEdge(.top, to: .bottom, of: welcomeLabel, withOffset: 150)
    }
    
    private func styleViews() {
        welcomeButton.backgroundColor = UIColor(red: 76/255, green: 178/255, blue: 223/255, alpha: 1)
        welcomeButton.layer.cornerRadius = 5
        welcomeButton.layer.borderWidth = 2
        welcomeButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        welcomeLabel.text = "Dobrodosle pijandure!"
        welcomeLabel.highlightedTextColor = .blue
    }
    
}
