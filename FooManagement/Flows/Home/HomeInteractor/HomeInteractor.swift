//
//  HomeInteractor.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol HomeBusinessLogic {
    func fetchOrders()
    func addOrder(_ order: Order)
    func removeOrder(_ order: Order)
    func changeOrderStatus(_ order: Order)
}

class HomeInteractor {
    let presenter: HomePresentationLogic
    let getOrdersWorker: GetOrdersLogic
    let addOrderWorker: AddOrderLogic
    let changeOrderStatusWorker: ChangeOrderStatusLogic
    let removeOrderWorker: RemoveOrderLogic
    
    init(presenter: HomePresentationLogic, database: DatabaseProtocol) {
        self.presenter = presenter
        self.getOrdersWorker = GetOrdersWorker(dataBaseManager: database)
        self.addOrderWorker = AddOrderWorker(dataBaseManager: database)
        self.changeOrderStatusWorker = ChangeOrderStatusWorker(dataBaseManager: database)
        self.removeOrderWorker = RemoveOrderWorker(dataBaseManager: database)
    }
}

extension HomeInteractor: HomeBusinessLogic {
    func fetchOrders() {
        let orders = getOrdersWorker.getOrders()
        self.presenter.updateOrdersList(orders)
    }
    
    func addOrder(_ order: Order) {
        addOrderWorker.addOrder(order)
        self.fetchOrders()
    }

    func changeOrderStatus(_ order: Order) {
        changeOrderStatusWorker.changeOrderStatus(order: order)
        self.fetchOrders()
    }
    
    func removeOrder(_ order: Order) {
        removeOrderWorker.removeOrder(order)
        self.fetchOrders()
    }
}
