//
//  OrderDetailsInteractor.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import Foundation

protocol OrderDetailsBusinessLogic {
    func changeOrderStatus(_ order: Order)
}

class OrderDetailsInteractor {
    let presenter: OrderDetailsPresentationLogic
    let changeOrderStatusWorker: ChangeOrderStatusLogic
    let findOrderWorker: FindOrderWorkerLogic
    init(presenter: OrderDetailsPresentationLogic, database: DatabaseProtocol) {
        self.presenter = presenter
        self.changeOrderStatusWorker = ChangeOrderStatusWorker(dataBaseManager: database)
        self.findOrderWorker = FindOrderWorker(dataBaseManager: database)
    }
}

extension OrderDetailsInteractor: OrderDetailsBusinessLogic {
    func changeOrderStatus(_ order: Order) {
        changeOrderStatusWorker.changeOrderStatus(order: order)
        let updatedOrder = findOrderWorker.findOrder(order: order)
        presenter.updateOrder(updatedOrder)
    }
}
