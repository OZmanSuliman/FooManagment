//
//  RemoveOrderWorker.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol RemoveOrderLogic {
    func removeOrder(_ order: Order)
}

class RemoveOrderWorker {
    var dataBaseManager: DatabaseProtocol
    
    init(dataBaseManager: DatabaseProtocol) {
        self.dataBaseManager = dataBaseManager
    }
}

extension RemoveOrderWorker: RemoveOrderLogic {
    func removeOrder(_ order: Order) {
        dataBaseManager.delete(object: order)
    }
}
