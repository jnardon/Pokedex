//
//  JSONStubFactory.swift
//  PokedexTests
//
//  Created by Marcelo Gobetti on 6/9/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class JSONStubFactory {
    static func data(fromJSONFileNamed jsonFileName: String) -> Data {
        let jsonURL = Bundle(for: JSONStubFactory.self).url(forResource: jsonFileName, withExtension: "json")!
        return try! Data(contentsOf: jsonURL)
    }
}

let listStub = JSONStubFactory.data(fromJSONFileNamed: "list")
let pokemonsStub = JSONStubFactory.data(fromJSONFileNamed: "pokemons")
