//
//  FavoriteListViewController.swift
//  Pokedex
//
//  Created by Elias Medeiros on 19/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class FavoriteListViewController: UIViewController {

    private let presenter: FavoriteListPresenterType = FavoriteListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.view = self
        self.presenter.fetchData()
    }
    
}

extension FavoriteListViewController: FavoriteListViewType {
    
    func reloadData() {
        
    }
    
}
