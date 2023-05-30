
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
        backgroundColor = UIColor(red: 76/255, green: 178/255, blue: 223/255, alpha: 1)
        layer.cornerRadius = 8
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemBlue.cgColor
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
