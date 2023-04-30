//
//  FindOrderWorker.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import Foundation

protocol FindOrderWorkerLogic {
    func findOrder(order: Order) -> Order
}

class FindOrderWorker {
    var dataBaseManager: DatabaseProtocol
    
    init(dataBaseManager: DatabaseProtocol) {
        self.dataBaseManager = dataBaseManager
    }
}


extension FindOrderWorker: FindOrderWorkerLogic {
    func findOrder(order: Order) -> Order {
        let predicate = NSPredicate(format: "id = %@", order.id)
        let updatedOrder: Order? = dataBaseManager.find(satisfying: predicate)
        guard let updatedOrder else { return order }
        return updatedOrder
    }
}
