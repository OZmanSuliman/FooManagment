//
//  APIErrorParsing.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol APIErrorParsing {

    func parse(response: HTTPURLResponse, data: Data?) -> APIError?
}

