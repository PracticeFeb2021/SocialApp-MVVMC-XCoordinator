
import UIKit
import XCoordinator

enum LoginRoute: Route {
    case login
    //case register
    //case forgotPassword
}

class LoginCoordinator: NavigationCoordinator<LoginRoute> {
    
    var appRouter: UnownedRouter<AppRoute>
    
    init(rootViewController: UINavigationController,
         initialRoute: LoginRoute = .login,
         appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: rootViewController, initialRoute: initialRoute)
    }
    
    override func prepareTransition(for route: LoginRoute) -> NavigationTransition {
        switch route {
        case .login:
            let vc = LoginVC.instantiateFromNib()
            let viewModel = LoginViewModel(netService: NetworkManager(), loginRouter: unownedRouter, appRouter: appRouter)
            vc.viewModel = viewModel
            return .push(vc)
        }
    }
}
