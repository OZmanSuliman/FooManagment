//
//  OrderDetailsPresenter.swift
//  FooManagement
//
//  Created by Osman Ahmed on 30/04/2023.
//

import Foundation

protocol OrderDetailsPresentationLogic {
    
}

class OrderDetailsPresenter {
    let viewController: OrderDetailsViewController
    init(viewController: OrderDetailsViewController) {
        self.viewController = viewController
    }
}

extension OrderDetailsPresenter: OrderDetailsPresentationLogic {
    
}
