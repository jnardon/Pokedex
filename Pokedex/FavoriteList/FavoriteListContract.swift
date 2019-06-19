//
//  FavoriteListContract.swift
//  Pokedex
//
//  Created by Elias Medeiros on 19/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

protocol FavoriteListViewType: AnyObject {
    
    func reloadData()
    
}

protocol FavoriteListPresenterType: UICollectionViewDataSource {
    var view: FavoriteListViewType? { get set }
    func fetchData()
    func pokemon(at index: Int) -> Pokemon
    
}

protocol FavoriteListInteractorInput {
    func fetchData()
}

protocol FavoriteListInteractorOutput: AnyObject {
    func dataFetched(_ data: [Pokemon])
}
