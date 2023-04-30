//
//  OrderDetailsConfig.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import UIKit

class OrderDetailsConfig {
    func createViewController() -> UIViewController {
        let vc = OrderDetailsViewController()
        let router = OrderDetailsRouter(viewController: vc)
        let presenter = OrderDetailsPresenter(viewController: vc)
        let interactor = OrderDetailsInteractor(presenter: presenter)
        vc.interactor = interactor
        vc.router = router
        
        return vc
    }
}
