//
//  PokemonListContract.swift
//  Pokedex
//
//  Created by Marcelo Gobetti on 6/9/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

protocol PokemonListViewType: AnyObject {
    var presenter: PokemonListPresenterType { get }
    func reloadData()
}

protocol PokemonListPresenterType: UITableViewDataSource {
    var view: PokemonListViewType? { get set }
    func fetchData()
    func pokemon(at index: Int) -> Pokemon
}

extension PokemonListViewType {
    func bind() {
        presenter.view = self
    }
}
