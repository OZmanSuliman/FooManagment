//
//  ExampleNetworkService.swift
//  FooManagement
//
//  Created by Osman Ahmed on 29/04/2023.
//

import Foundation

protocol ExampleNetworkServiceProtocol {
    func fetchResponse(id: Int, completion: @escaping (Result<ExampleResponse, BackendError>) -> Void)
}

class ExampleNetworkService: ExampleNetworkServiceProtocol {
    private let networkingManager: NetworkingProtocol
    private let keychainService: KeychainProtocol
    init(networkingManager: NetworkingProtocol, keychainService: KeychainProtocol) {
        self.networkingManager = networkingManager
        self.keychainService = keychainService
    }
    
    func fetchResponse(id: Int, completion: @escaping (Result<ExampleResponse, BackendError>) -> Void) {
        let request: ExampleRequest = ExampleRequest()
        
        networkingManager.apiRequest(request) { (response: ExampleResponse?, error) in
            if let backendError = error as? BackendError {
                    completion(.failure(backendError))
            } else if let response {
                completion(.success(response))
            }  else if let error {
                let backendError = BackendError(statusCode: 400, message: error.localizedDescription, reason: .generic)
                completion(.failure(backendError))
            }
        }
    }
}

