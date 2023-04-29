//
//  GetOrdersWorker.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation
protocol GetOrdersLogic {
    func getOrders() -> [Order]
}
class GetOrdersWorker {

    var dataBaseManager: DatabaseProtocol
    
    init(dataBaseManager: DatabaseProtocol) {
        self.dataBaseManager = dataBaseManager
    }
    
}


extension GetOrdersWorker: GetOrdersLogic {
    func getOrders() -> [Order] {
        let orders: [Order] = dataBaseManager.fetch()
        
        return orders
    }
}
