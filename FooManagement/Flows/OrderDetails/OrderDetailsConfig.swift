//
//  OrderDetailsConfig.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import UIKit

class OrderDetailsConfig {
    func createViewController(order: Order) -> UIViewController {
        let vc = OrderDetailsViewController.initFromNib()
        let router = OrderDetailsRouter(viewController: vc)
        let presenter = OrderDetailsPresenter(viewController: vc)
        let interactor = OrderDetailsInteractor(presenter: presenter, database: ServicesFactory.shared.makeDatabaseService())
        vc.interactor = interactor
        vc.router = router
        vc.order = order
        return vc
    }
}
