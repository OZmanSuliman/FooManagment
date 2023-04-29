//
//  AddOrderWorker.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol AddOrderLogic {
    func addOrder(_ order: Order)
}

class AddOrderWorker {
    var dataBaseManager: DatabaseProtocol
    
    init(dataBaseManager: DatabaseProtocol) {
        self.dataBaseManager = dataBaseManager
    }
}

extension AddOrderWorker: AddOrderLogic {
    func addOrder(_ order: Order) {
        dataBaseManager.save(order)
    }
}
