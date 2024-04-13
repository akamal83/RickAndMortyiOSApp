//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Ahmed Kamal on 12/04/2024.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {

//    https://rickandmortyapi.com/api/character/2

    
    /// the API constants
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    /// Desired Endpoints
    private let endPoint: RMEndpoint
    
    /// Path components for API if any
    private let pathComponents: Set<String>
    
    /// Query rguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed URl for the API request in string format
    public var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"  //<I had to comment it one time>
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "/\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        
        return string
    }
    
    /// Computed and constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// desired http method
    public let httpMethod = "GET"
    
    
    //Mark: - Public
    /// Construct request
    /// - Parameters:
    ///   - endPoint: Target endpoint
    ///   - pathComponents: collection of path components
    ///   - queryParameters: collection of query parameters
    public init(endPoint: RMEndpoint,
         pathComponents: Set<String> = [],
         queryParameters:[URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
