//
//  HomePresenter.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol HomePresentationLogic {
    func updateOrdersList(_ orders: [Order])
}

class HomePresenter {
    let viewController: HomeDisplayLogic
    init(viewController: HomeDisplayLogic) {
        self.viewController = viewController
    }
}

extension HomePresenter: HomePresentationLogic {
    func updateOrdersList(_ orders: [Order]) {
        viewController.displayOrders(orders)
    }
}
