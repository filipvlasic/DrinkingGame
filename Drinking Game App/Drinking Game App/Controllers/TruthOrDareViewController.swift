
import UIKit

class TruthOrDareViewController: UIViewController {

    var router: AppRouter!
    var segment: UISegmentedControl!
    var truthButton: CustomizedButton!
    var dareButton: CustomizedButton!
    var chooseLabel: UILabel!
    var infoButton: UIButton!
    
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
        segment = UISegmentedControl(items: ["Blaga", "Zacinjena", "Mjesana"])
        truthButton = CustomizedButton()
        dareButton = CustomizedButton()
        chooseLabel = UILabel()
        infoButton = UIButton(type: .infoLight)
        let barButton = UIBarButtonItem(customView: infoButton)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    private func layoutViews() {
        view.addSubview(chooseLabel)
        
        chooseLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        chooseLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 50)
        
        view.addSubview(segment)
        
        segment.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        segment.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        segment.autoPinEdge(.top, to: .bottom, of: chooseLabel, withOffset: 20)
        
        view.addSubview(truthButton)
        
        truthButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        truthButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        truthButton.autoPinEdge(.top, to: .bottom, of: segment, withOffset: 90)
        truthButton.autoSetDimension(.height, toSize: 60)
        
        view.addSubview(dareButton)
        
        dareButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        dareButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        dareButton.autoPinEdge(.top, to: .bottom, of: truthButton, withOffset: 20)
        dareButton.autoSetDimension(.height, toSize: 60)
    }
    
    private func styleViews() {
        view.backgroundColor = .lightGray
        self.title = "Istina izazov"
        chooseLabel.text = "Koliko ste hrabri?"
        
        truthButton.setTitle("Istina", for: .normal)
        
        dareButton.setTitle("Izazov", for: .normal)
    }
    
    private func addActions() {
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        truthButton.addTarget(self, action: #selector(truthDareTapped), for: .touchUpInside)
        dareButton.addTarget(self, action: #selector(truthDareTapped), for: .touchUpInside)
    }
    
    @objc private func infoButtonTapped() {
//        router.showGameDetailsScreen()
    }
    
    @objc private func truthDareTapped() {
        router.showTruthOrDareQuestionsScreen()
    }

}
