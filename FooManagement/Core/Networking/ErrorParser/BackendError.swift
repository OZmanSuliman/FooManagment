//
//  BackendError.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

enum Reason {
    case generic
    case networkConnectionError
    case serverError
    case requestTimeOut
}

struct BackendError: APIError {

    var statusCode: Int
    var message: String
    var reason: Reason

    init(statusCode: Int, message: String, reason: Reason) {
        self.statusCode = statusCode
        self.message = message
        self.reason = reason
    }
}

extension BackendError {

    static var unauthorized: BackendError {
        return BackendError(statusCode: 401, message: Strings.unauthorized.fullString(), reason: .generic)
    }

    static func serverError(withCode code: Int) -> BackendError {
        return BackendError(statusCode: code, message: Strings.unauthorized.fullString(withParameters: "\(code)"), reason: .serverError)
    }

    static var requestTimedOut: BackendError {
        return BackendError(statusCode: -1001, message: Strings.requestTimedOut.fullString(), reason: .requestTimeOut)
    }
}

