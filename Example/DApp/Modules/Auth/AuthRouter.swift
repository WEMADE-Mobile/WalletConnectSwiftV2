import UIKit

final class AuthRouter {
    weak var viewController: UIViewController!

    private let app: Application

    init(app: Application) {
        self.app = app
    }
    
    func dismiss() {
        viewController.dismiss(animated: true)
        UIApplication.shared.open(URL(string: "showcase://")!)
    }
}
