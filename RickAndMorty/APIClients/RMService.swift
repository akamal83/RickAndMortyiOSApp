//
//  RMService.swift
//  RickAndMorty
//
//  Created by Ahmed Kamal on 12/04/2024.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared sigleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: the type of object that we expect to get beck
    ///   - completion: callback with data or error
    public func excute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
