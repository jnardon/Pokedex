//
//  PokemonListContract.swift
//  Pokedex
//
//  Created by Marcelo Gobetti on 6/9/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

protocol PokemonListViewType: AnyObject {
    func reloadData()
}

protocol PokemonListPresenterType: UITableViewDataSource {
    var view: PokemonListViewType? { get set }

    func fetchData()
    func pokemon(at index: Int) -> Pokemon
    func swipe(at index: Int)
    func swipeAction(for index: Int) -> PokemonSwipeAction
}

protocol PokemonListInteractorInput {
    func fetchData()
}

protocol PokemonListInteractorOutput: AnyObject {
    func dataFetched(_ data: PokemonList)
}
