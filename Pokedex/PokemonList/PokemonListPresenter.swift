//
//  PokemonListPresenter.swift
//  Pokedex
//
//  Created by Marcelo Gobetti on 6/9/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonListPresenter: NSObject {

    weak var view: PokemonListViewType?

    private let requestMaker: RequestMaker

    private var pokemonList = [Pokemon]()

    init(requestMaker: RequestMaker = RequestMaker()) {
        self.requestMaker = requestMaker
    }

}

extension PokemonListPresenter: PokemonListPresenterType {

    func fetchData() {
        requestMaker.make(withEndpoint: .list) { (pokemonList: PokemonList) in
            self.pokemonList = pokemonList.pokemons

            DispatchQueue.main.async {
                self.view?.reloadData()
            }
        }
    }

    func pokemon(at index: Int) -> Pokemon {
        return self.pokemonList[index]
    }

}

extension PokemonListPresenter: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemon", for: indexPath)

        if let pokemonCell = cell as? PokemonTableViewCell {
            pokemonCell.config(with: self.pokemonList[indexPath.row])
        }

        return cell
    }

}
