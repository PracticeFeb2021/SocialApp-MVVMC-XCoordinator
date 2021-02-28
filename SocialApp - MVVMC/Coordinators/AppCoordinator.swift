
import UIKit
import XCoordinator

enum AppRoute: Route {
    case login
    case home
    //case onboarding
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init(initialRoute: AppRoute = .login) {
        super.init(initialRoute: initialRoute)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .login:
            let loginCoordinator = LoginCoordinator(rootViewController: self.rootViewController, initialRoute: .login, appRouter: unownedRouter) // non-modal
            addChild(loginCoordinator)
            return .none()
            
        case .home:
            let homeCoordinator = HomeCoordinator(rootViewController: self.rootViewController, initialRoute: nil)
            addChild(homeCoordinator)
            homeCoordinator.trigger(.posts) // modal
            return .none()
        }
    }
}
