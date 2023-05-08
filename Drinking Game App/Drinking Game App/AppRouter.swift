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
        let gamesListViewController = GamesListViewController(router: self)
        self.navigationController.pushViewController(gamesListViewController, animated: true)
    }
    
    func showNeverHaveIEverScreen() {
        let neverHaveIEverViewController = NeverHaveIEverViewController(router: self)
        self.navigationController.pushViewController(neverHaveIEverViewController, animated: true)
    }
    
    func showIgra3Screen() {
        let igra3ViewController = Igra3ViewController(router: self)
        self.navigationController.pushViewController(igra3ViewController, animated: true)
    }
    
    func showTruthOrDareScreen() {
        let truthOrDare = TruthOrDareViewController(router: self)
        self.navigationController.pushViewController(truthOrDare, animated: true)
    }
    
}

