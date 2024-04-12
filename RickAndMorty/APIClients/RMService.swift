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
    ///   - completion: callback with data or error
    public func excute(_ request: RMRequest, completion: @escaping () -> Void) {}
}
