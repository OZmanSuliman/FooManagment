//
//  APIError.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol APIError: Error {
    var statusCode: Int { get }
    var message: String { get }
    var reason: Reason { get }
}
