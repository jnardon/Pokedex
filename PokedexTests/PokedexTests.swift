//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Marcelo Gobetti on 6/9/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

@testable import Pokedex
import XCTest

class PokedexTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecoding() {
        let jsonURL = Bundle(for: PokedexTests.self).url(forResource: "pokemons", withExtension: "json")!
        let data = try! Data(contentsOf: jsonURL)

        XCTAssertNoThrow(try Pokedex.RequestMaker.decoder.decode(PokemonResponse.self, from: data))
    }

    func testRequestList() {
        let requestMaker = RequestMaker()
        var received: PokemonList?
        requestMaker.make(withEndpoint: .list) { (list: PokemonList) in
            received = list
        }
        sleep(1)
        // xcode 11: let unwrappedReceived = try XCTUnwrap(received)
        XCTAssertNotNil(received) // useless
        XCTAssertGreaterThan(received!.pokemons.count, 0)
    }
}
