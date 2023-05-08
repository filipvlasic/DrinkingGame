
import UIKit

class NeverHaveIEverViewController: UIViewController {
    
    var router: AppRouter!
    var segment: UISegmentedControl!
    var startButton: CutomizedButton!
    var chooseLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
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
        startButton = CutomizedButton()
        chooseLabel = UILabel()
    }
    
    private func layoutViews() {
        view.addSubview(chooseLabel)
        
        chooseLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        chooseLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 50)
        
        view.addSubview(segment)
        
        segment.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        segment.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        segment.autoPinEdge(.top, to: .bottom, of: chooseLabel, withOffset: 20)
        
        view.addSubview(startButton)
        
        startButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        startButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        startButton.autoPinEdge(.top, to: .bottom, of: segment, withOffset: 90)
        startButton.autoSetDimension(.height, toSize: 60)
    }
    
    private func styleViews() {
        view.backgroundColor = .lightGray
        self.title = "Nikad nisam"
        chooseLabel.text = "Koliko ste hrabri?"
        
        startButton.setTitle("Krenimo!", for: .normal)
    }
    

}
