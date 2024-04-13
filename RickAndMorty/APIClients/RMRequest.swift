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

    
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    private let endPoint: RMEndpoint
    
    private let pathComponents: [String]
    
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
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    init(endPoint: RMEndpoint,
         pathComponents: [String] = [],
         queryParameters:[URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
