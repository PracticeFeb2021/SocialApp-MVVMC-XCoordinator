
import UIKit
import XCoordinator

enum PostsRoute: Route {
    case postList
    case post(Post)
    case logout
}

class PostsCoordinator: NavigationCoordinator<PostsRoute> {
    
    var homeRouter: UnownedRouter<HomeRoute>
    
    init(router: UnownedRouter<HomeRoute>) {
        self.homeRouter = router
        super.init(initialRoute: .postList)
    }
    
    override func prepareTransition(for route: PostsRoute) -> NavigationTransition {
        
        switch route {
        case .postList:
            let vc = PostListVC.instantiateFromNib()
            let viewModel = PostListViewModel(router: unownedRouter, netService: NetworkManager())
            vc.viewModel = viewModel
            return .push(vc)
            
        case .post(let post):
            let vc = PostVC.instantiateFromNib()
            let viewModel = PostViewModel(post, unownedRouter, NetworkManager())
            vc.viewModel = viewModel
            return .push(vc)
            
        case .logout:
            homeRouter.trigger(.logout)
            return .none()
        }
    }
}
