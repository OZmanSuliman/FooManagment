//
//  ExampleAPI.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

enum ExampleAPI: String {
    case test
    
    /** Contains the full path to the endpoint */
    func fullPath(withParameters parameters: CVarArg...) -> String {
        var endpoint = self.rawValue

        if parameters.count > 0 {
            endpoint = String(format: endpoint, arguments: parameters)
        }

        return "\(EnvironmentManager.shared.getBaseUrl())/\(endpoint)"
    }
}
