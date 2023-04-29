//
//  APIResponseProtocol.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol APIResponseProtocol {

    init(with json: Any)
}

public enum RequestCallback<T> {
    case success(T)
    case failed(AppError)
}
public enum AppError: Error {
    case gernalError(message: String)
}

