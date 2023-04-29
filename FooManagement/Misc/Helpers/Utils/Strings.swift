//
//  Strings.swift
//  FooManagement
//
//  Created by Osman Ahmed on 28/04/2023.
//

import Foundation


enum Strings: String {
    case EnvironmentVariables
    case Configuration
    case plist
    case noSetting = "No <%@> setting has been found"
    case environmentVariablesPlist = "EnvironmentVariables.plist"
    case unableToLoadPLIST = "Unable to load PLIST at path: %@"
    case PropertyNotOfType = "Property %@ is not of type %@"
    
    func fullString(withParameters parameters: CVarArg...) -> String {
        var str = rawValue

        if parameters.count > 0 {
            str = String(format: str, arguments: parameters)
        }

        return str
    }
}
