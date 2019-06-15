//
//  PokemonListPresenterTests.swift
//  PokedexTests
//
//  Created by Marcelo Gobetti on 6/15/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

@testable import Pokedex
import XCTest

class PokemonListPresenterTests: XCTestCase {

    func testFetchData() {
        let expectation = XCTestExpectation(description: "")

        let presenter = PokemonListPresenter()
        let view = PokemonListViewMock {
            expectation.fulfill()
        }
        presenter.view = view
        presenter.fetchData()

        wait(for: [expectation], timeout: 1.0)
    }

}

class PokemonListViewMock: PokemonListViewType {
    let fulfill: () -> Void

    init(fulfill: @escaping () -> Void) {
        self.fulfill = fulfill
    }

    func reloadData() {
        self.fulfill()
    }
}
