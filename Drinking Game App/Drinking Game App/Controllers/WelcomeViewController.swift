
import UIKit
import PureLayout

class WelcomeViewController: UIViewController {
    
    var router: AppRouter!
    private var welcomeButton: CustomizedButton!
    private var welcomeLabel: UILabel!

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
        welcomeLabel = UILabel()
        welcomeButton = CustomizedButton()
    }
    
    private func layoutViews() {
        view.addSubview(welcomeLabel)
        welcomeLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        welcomeLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 100)
        
        view.addSubview(welcomeButton)
        welcomeButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        welcomeButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        welcomeButton.autoPinEdge(.top, to: .bottom, of: welcomeLabel, withOffset: 250)
        welcomeButton.autoSetDimension(.height, toSize: 60)
    }
    
    private func styleViews() {
        welcomeButton.setTitle("Idemo pit!", for: .normal)
        
        welcomeLabel.text = "Dobrodosle pijandure!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 25)
        view.backgroundColor = .lightGray
    }
    
    private func addActions() {
        welcomeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        router.showGamesList()
    }
    
}
