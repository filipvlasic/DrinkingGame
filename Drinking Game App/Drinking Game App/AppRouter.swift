import Foundation
import UIKit

class AppRouter {
    
    private let navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func setStartScreen(in window: UIWindow?) {
        let welcomeViewController = WelcomeViewController(router: self)
        navigationController.pushViewController(welcomeViewController, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func showGamesList() {
        let gamesListViewController = GamesListViewController()
        self.navigationController?.pushViewController(gamesListViewController, animated: true)
    }
    
}

