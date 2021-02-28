
import UIKit
import XCoordinator


extension Transition {
    
    static func presentFullScreen(_ presentable: Presentable, animation: Animation? = nil) -> Transition {
        presentable.viewController?.modalPresentationStyle = .fullScreen
        return .present(presentable, animation: animation)
    }
    
    static func dismissAll() -> Transition {
        return Transition(presentables: [],
                          animationInUse: nil) { rootVC, options, completion in
            guard let presentedVC = rootVC.presentedViewController else {
                completion?()
                return
            }
            presentedVC.dismiss(animated: options.animated) {
                Transition.dismissAll()
                    .perform(on: rootVC, with: options, completion: completion)
            }
        }
    }
}
