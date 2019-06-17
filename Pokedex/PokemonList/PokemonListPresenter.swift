//
//  PokemonListPresenter.swift
//  Pokedex
//
//  Created by Marcelo Gobetti on 6/15/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonListPresenter: NSObject {

    weak var view: PokemonListViewType?
    
    private lazy var interactor: PokemonListInteractorInput = PokemonListInteractor(output: self)

    private let requestMaker = RequestMaker()

    private var pokemonList = [Pokemon]()
    
    private let idsKey = "favorites.ids"
    
    override init() {
        if let data = UserDefaults.standard.array(forKey: idsKey) as? [String] {
            self.favoritesIds = Set(data)
        } else {
            self.favoritesIds = []
        }
        
        super.init()
    }
    
    private var favoritesIds: Set<String> {
        didSet {
            print(favoritesIds)
            UserDefaults.standard.set(Array(favoritesIds), forKey: idsKey)
        }
    }

}

extension PokemonListPresenter: PokemonListPresenterType {

    func fetchData() {
        self.interactor.fetchData()
    }

    func pokemon(at index: Int) -> Pokemon {
        return self.pokemonList[index]
    }
    
    func swipe(at index: Int) {
        let pokemonId = pokemon(at: index).id
        
        guard self.favoritesIds.contains(pokemonId) else {
            self.favoritesIds.insert(pokemonId)
            return
        }
        
        self.favoritesIds.remove(pokemonId)
    }
    
    func swipeAction(for index: Int) -> PokemonSwipeAction {
        return self.favoritesIds.contains(pokemon(at: index).id) ?
            .removeFavorite :
            .addFavorite
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

extension PokemonListPresenter: PokemonListInteractorOutput {

    func dataFetched(_ data: PokemonList) {
        self.pokemonList = data.pokemons
        
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
    }
    
}
