
import UIKit
import PureLayout

class WelcomeViewController: UIViewController {
    
    var router: AppRouter!
    private var welcomeButton: CustomizedButton!
    private var welcomeLabel: UILabel!
    private var checkboxButton: UIButton!
    private var checkboxLabel: UILabel!
    
    private var isCheckboxChecked: Bool = false {
        didSet {
            welcomeButton.isEnabled = isCheckboxChecked
            welcomeButton.alpha = isCheckboxChecked ? 1.0 : 0.5
        }
    }

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
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "glasses2")
        backgroundImage.contentMode = .scaleAspectFit
        view.insertSubview(backgroundImage, at: 0)
        
        welcomeLabel = UILabel()
        welcomeButton = CustomizedButton()
        checkboxButton = UIButton()
        checkboxLabel = UILabel()
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
        
        view.addSubview(checkboxButton)
        checkboxButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        checkboxButton.autoPinEdge(.top, to: .bottom, of: welcomeButton, withOffset: 20)
        checkboxButton.autoSetDimensions(to: CGSize(width: 20, height: 20))
        
        view.addSubview(checkboxLabel)
        checkboxLabel.autoPinEdge(.leading, to: .trailing, of: checkboxButton, withOffset: 10)
        checkboxLabel.autoAlignAxis(.horizontal, toSameAxisOf: checkboxButton)
        
    }
    
    private func styleViews() {
        view.backgroundColor = .white
        
        welcomeLabel.text = "TI PIJEŠ"
        welcomeLabel.font = UIFont.systemFont(ofSize: 25)
        welcomeLabel.font = UIFont(name: "MarkerFelt-Wide", size: 70)
        welcomeLabel.textColor = .darkGray
        
        welcomeButton.setTitle("AJMO", for: .normal)
        welcomeButton.isEnabled = false
        welcomeButton.alpha = 0.5
        
        checkboxButton.setImage(UIImage(named: "checkbox_unchecked"), for: .normal)
        checkboxButton.setImage(UIImage(named: "checkbox_checked"), for: .selected)
        checkboxButton.addTarget(self, action: #selector(checkboxButtonAction), for: .touchUpInside)
        
        checkboxLabel.text = "Prihvaćam odgovornost igranja"
        checkboxLabel.font = UIFont.systemFont(ofSize: 16)
        checkboxLabel.textColor = .darkGray
    }
    
    private func addActions() {
        welcomeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        router.showGamesList()
    }
    
    @objc func checkboxButtonAction(sender: UIButton!) {
        sender.isSelected = !sender.isSelected
        isCheckboxChecked = sender.isSelected
    }
    
}
