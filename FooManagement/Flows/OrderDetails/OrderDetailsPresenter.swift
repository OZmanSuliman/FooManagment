//
//  OrderDetailsPresenter.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import Foundation

protocol OrderDetailsPresentationLogic {
    func updateOrder(_ order: Order)
}

class OrderDetailsPresenter {
    let viewController: OrderDetailsDisplayLogic
    init(viewController: OrderDetailsDisplayLogic) {
        self.viewController = viewController
    }
}

extension OrderDetailsPresenter: OrderDetailsPresentationLogic {
    func updateOrder(_ order: Order) {
        self.viewController.updateOrder(order)
    }
}
