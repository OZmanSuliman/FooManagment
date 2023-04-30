//
//  HomeRouter.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

protocol HomeRoutingLogic {
    func navigateToDetails(order: Order)
}

class HomeRouter {
    let viewController: UIViewController
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRoutingLogic {
    func navigateToDetails(order: Order) {
        let orderDetailsVC = OrderDetailsViewController().config.createViewController(order: order)
//        self.viewController.present(orderDetailsVC, animated: true)
        self.viewController.navigationController?.pushViewController(orderDetailsVC, animated: true)
    }
}
