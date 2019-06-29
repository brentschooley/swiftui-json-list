//
//  NetworkingManager.swift
//  ListFromJson
//
//  Created by Brent Schooley on 6/28/19.
//  Copyright © 2019 Brent Schooley. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager : BindableObject {
    var didChange = PassthroughSubject<NetworkingManager, Never>()
    
    var pokemonList = PokemonAPIList(results: []) {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokemonAPIList.self, from: data)
            
            DispatchQueue.main.async {
                self.pokemonList = pokemonList
            }
        }.resume()
    }
}
