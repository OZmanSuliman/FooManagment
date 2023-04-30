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
    case unauthorized
    case serverError = "Server Error %@"
    case requestTimedOut
    case invalidResponse
    case invalidServerURL
    case networkIssue = "Network Not Available"
    case appStateSerialQueue
    case identifier
    case status
    case errors
    case succeeded
    case message
    case error
    case access_token
    case refresh_token
    case expires_token_time
    case lastUpdatedApiTokenTimeInfo
    case hasApiAccessTokenInfo
    // colors
    case Orange

    // images
    case HeaderBg = "Header-bg"
    case plus
    case StrawberryMilkshake = "Strawberry-Milkshake"
    case emptyList = "no-money"
    case backButton = "Chevron-left-BlackColor"
    case trash = "trash.fill"
    
    // Text
    case Orders
    case FooManagement = "Foo Management"
    case createNewOrder = "Create new order"
    case noOrders = "No Orders To Show"
    case addOrders = "Add Some Orders To Preview"
    case Delete
    case orderNumber = "order number"
    case order = "order #"
    case aed = "AED"
    case orderStatus = "Order Status"
    case orderDate = "Order Date"
    case total = "Total"
    func fullString(withParameters parameters: CVarArg...) -> String {
        var str = rawValue

        if parameters.count > 0 {
            str = String(format: str, arguments: parameters)
        }

        return str
    }
}
