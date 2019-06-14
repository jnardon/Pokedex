//
//  File.swift
//  Pokedex
//
//  Created by Juliano Nardon on 07/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

enum PokemonType: String, Codable {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fight
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    
    var icon: UIImage? {
        return UIImage(named: "ic_\(self.rawValue)")
    }
    
    var color: UIColor? {
        return UIColor(named: "\(self.rawValue)")
    }
}
