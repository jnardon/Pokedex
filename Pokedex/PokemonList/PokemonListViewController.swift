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

    private let presenter: PokemonListPresenterType = PokemonListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTable()
        self.presenter.view = self
        self.presenter.fetchData()
    }
    
    private func configTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = presenter
    }

}

extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = self.storyboard
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailViewController.pokemon = self.presenter.pokemon(at: indexPath.row)
            self.navigationController?.present(detailViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionType = self.presenter.swipeAction(for: indexPath.row)
        
        let contextualAction = UIContextualAction(style: .normal, title: actionType.text) { (action, view, handler) in
            
            self.presenter.swipe(at: indexPath.row)
            
            handler(true)
        }
        
        contextualAction.backgroundColor = actionType.color
        
        let configuration = UISwipeActionsConfiguration(actions: [contextualAction])
        return configuration
    }
}

extension PokemonListViewController: PokemonListViewType {
    func reloadData() {
        self.activityIndicatorView.isHidden = true
        self.tableView.reloadData()
    }
}

enum PokemonSwipeAction {
    
    var color: UIColor {
        switch self {
        case .addFavorite:
            return .purple
        case .removeFavorite:
            return .red
        }
    }
    
    case addFavorite, removeFavorite
    
    var text: String {
        switch self {
        case .addFavorite:
            return "Adicionar"
        case .removeFavorite:
            return "Remover"
        }
    }
    
}
