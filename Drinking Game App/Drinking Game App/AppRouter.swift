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
    
    func showNeverHaveIEverScreen() -> NeverHaveIEverViewController {
        let neverHaveIEverViewController = NeverHaveIEverViewController(router: self)
        self.navigationController.pushViewController(neverHaveIEverViewController, animated: true)
        return neverHaveIEverViewController
    }
    
    func showSegeSaleScreen() {
        let segeSaleViewController = SegeSaleViewController(router: self)
        self.navigationController.pushViewController(segeSaleViewController, animated: true)
    }
    
    func showGameDetailsScreen(gameTitle: String, gameDescription: String) {
        let gameDetailsViewController = GameDetailsViewController(gameTitle: gameTitle, gameDescription: gameDescription)
        self.navigationController.present(gameDetailsViewController, animated: true)
    }
    
    func popQuestionsScreen() {
        self.navigationController.popViewController(animated: true)
    }
    
    func showNeverHaveIEverQuestionsScreen(with questions: [String]) {
        let neverHaveIEverQuestionsViewController = NeverHaveIEverQuestionsViewController(questions: questions)
        self.navigationController.pushViewController(neverHaveIEverQuestionsViewController, animated: true)
    }
    
}

