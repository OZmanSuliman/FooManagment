//
//  OrderDetailsRouter.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import Foundation

protocol OrderDetailsRouterLogic {
    
}

class OrderDetailsRouter {
    let viewController: OrderDetailsViewController
    init(viewController: OrderDetailsViewController) {
        self.viewController = viewController
    }
}

extension OrderDetailsRouter: OrderDetailsRouterLogic {
    
}
