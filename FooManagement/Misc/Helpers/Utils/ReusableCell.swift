//
//  ReusableCell.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

public protocol Reusable {
    static var identifierCell: String {get} // reuse Identifier is also nib name
}
