//
//  Pokemon.swift
//  Pokedex
//
//  Created by Elias Medeiros on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct PokemonList: Codable {
    
    let pokemons: [Pokemon]
    
}

struct Pokemon: Codable {
    
    let id: String
    let name: String
    let image: String
    let types: [PokemonType]
    
}
