//
//  PokemonListPresenterTests.swift
//  PokedexTests
//
//  Created by Marcelo Gobetti on 6/9/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

@testable import Pokedex
import XCTest

class PokemonListPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReloadDataIsCalledOnSuccess() {
        let view = PokemonListViewMock()
        view.bind()
        view.presenter.fetchData()
        XCTAssertTrue(view.didCallReloadData)
    }

}

class PokemonListViewMock: PokemonListViewType {
    var presenter: PokemonListPresenterType = PokemonListPresenter()
    var didCallReloadData = false

    func reloadData() {
        didCallReloadData = true
    }
}
