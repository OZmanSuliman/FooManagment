//
//  UITableViewCell+Extension.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit


extension UITableViewCell: Reusable {
    public static var identifierCell: String { return String(describing: self)}
}
