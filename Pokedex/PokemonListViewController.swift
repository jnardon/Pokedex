//
//  ViewController.swift
//  Pokedex
//
//  Created by Juliano Nardon on 07/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let requestMaker = RequestMaker()
    
    var pokemonList = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTable()
        self.fetchData()
    }
    
    private func configTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}


extension PokemonListViewController: UITableViewDataSource {
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

extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = self.storyboard
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailViewController.pokemon = self.pokemonList[indexPath.row]
            self.navigationController?.present(detailViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let action = UIContextualAction(style: .destructive, title: "Teste") { (action, view, handler) in
            print("swipoooou")
            
            handler(true)
        }
        

        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [])
    }
    
}

// TODO: criar uma ViewModel de verdade
typealias PokemonListViewModel = PokemonListViewController

extension PokemonListViewModel {
    
    func fetchData() {
        requestMaker.make(withEndpoint: .list) { (pokemonList: PokemonList) in
            self.pokemonList = pokemonList.pokemons
            
            DispatchQueue.main.async {
               self.activityIndicatorView.isHidden = true
               self.tableView.reloadData()
            }
        }
    }
    
}
