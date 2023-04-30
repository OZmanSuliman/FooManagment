//
//  HomeRouter.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

protocol HomeRoutingLogic {
    func navigateToDetails()
}

class HomeRouter {
    let viewController: UIViewController
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRoutingLogic {
    func navigateToDetails() {
        let orderDetailsVC = OrderDetailsViewController().config.createViewController()
        self.viewController.present(orderDetailsVC, animated: true)
    }
}
