
import UIKit

class CustomizedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpButton() {
        setShadow()
        backgroundColor = UIColor(red: 1.00, green: 0.49, blue: 0.29, alpha: 1.00)
        layer.cornerRadius = 8
        layer.borderWidth = 0
        setTitleColor(.systemGray, for: .disabled)

    }
    
    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    

}
