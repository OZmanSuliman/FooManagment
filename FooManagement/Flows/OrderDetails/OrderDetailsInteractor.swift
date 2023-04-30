//
//  OrderDetailsInteractor.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import Foundation

protocol OrderDetailsBusinessLogic {
    
}

class OrderDetailsInteractor {
    let presenter: OrderDetailsPresentationLogic
    
    init(presenter: OrderDetailsPresentationLogic) {
        self.presenter = presenter
    }
}

extension OrderDetailsInteractor: OrderDetailsBusinessLogic {
    
}
