
import UIKit
import XCoordinator

enum HomeRoute: Route {
    case posts 
    case logout
    //case settings
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
        case .posts:
            //modal presentation
            let coord = PostsCoordinator(router: unownedRouter)
            return .presentFullScreen(coord)
            
        case .logout:
            return .dismissToRoot()
        }
    }
}
