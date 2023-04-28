//
//  ViewController.swift
//  FooManagement
//
//  Created by Osman Ahmed on 28/04/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(EnvironmentManager.shared.getBaseUrl())
    }


}

