//
//  Order.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation
import RealmSwift

class Order: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var desc: String
    @Persisted var image: String = Strings.StrawberryMilkshake.fullString()
    @Persisted var status: Int
    @Persisted var price: String
    @Persisted var createdAt = Date()
    
    override init() {
        super.init()
    }
    
    init(id: String = UUID().uuidString, name: String, desc: String, image: String, status: Int, price: String, createdAt: Date = Date()) {
        super.init()
        self.id = id
        self.name = name
        self.desc = desc
        self.image = image
        self.status = status
        self.price = price
        self.createdAt = createdAt
    }
}
