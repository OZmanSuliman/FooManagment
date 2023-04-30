//
//  ChangeOrderStatusWorker.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol ChangeOrderStatusLogic {
    func changeOrderStatus(order: Order)
}

class ChangeOrderStatusWorker {
    var dataBaseManager: DatabaseProtocol
    
    init(dataBaseManager: DatabaseProtocol) {
        self.dataBaseManager = dataBaseManager
    }
}

extension ChangeOrderStatusWorker: ChangeOrderStatusLogic {
    func changeOrderStatus(order: Order) {
        let updatedOrder = Order(id: order.id, name: order.name,
                                 desc: order.desc, image: order.image,
                                 status: order.status < 3 ? order.status + 1 : order.status,
                                 price: order.price)
        dataBaseManager.update(updatedOrder)
    }
}
