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
        let expectation = XCTestExpectation(description: "")

        let requestMaker = RequestMakerStubFactory.success()
        let presenter = PokemonListPresenter(requestMaker: requestMaker)

        let view = PokemonListViewMock(presenter: presenter, onReloadDataCalled: {
            expectation.fulfill()
        })
        view.bind()
        view.presenter.fetchData()

        wait(for: [expectation], timeout: 1.0)
    }

}

class PokemonListViewMock: PokemonListViewType {
    let presenter: PokemonListPresenterType
    let onReloadDataCalled: () -> Void

    init(presenter: PokemonListPresenterType,
         onReloadDataCalled: @escaping () -> Void) {
        self.presenter = presenter
        self.onReloadDataCalled = onReloadDataCalled
    }

    func reloadData() {
        onReloadDataCalled()
    }
}
