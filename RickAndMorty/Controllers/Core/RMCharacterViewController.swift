//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Ahmed Kamal on 12/04/2024.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endPoint: .character,
        queryParameters: [URLQueryItem(name: "name", value: "rick"),
                         URLQueryItem(name: "status", value: "alive")])
        
        print(request.url)
    }
}
