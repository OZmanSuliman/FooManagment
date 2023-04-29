//
//  UIViewController+Extension.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import UIKit

extension UIViewController {
    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}
