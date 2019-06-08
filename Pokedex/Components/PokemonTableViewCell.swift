//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Elias Medeiros on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var primaryTypeImageView: UIImageView!
    @IBOutlet weak var secondaryTypeImageView: UIImageView!
    
    func config(with model: Pokemon) {
        // carregar imagem do pokemon
        pictureImageView.loadImage(from: model.image)        
        nameLabel.text = model.name.capitalized
        idLabel.text = model.id
        primaryTypeImageView.image = model.types.first?.icon
        
        if model.types.count > 1 {
            secondaryTypeImageView.superview?.isHidden = false
            secondaryTypeImageView.image = model.types[1].icon
        } else {
//            secondaryTypeImageView.isHidden = true
            // nao me xinga gobetti plis
            secondaryTypeImageView.superview?.isHidden = true
        }
    }
    

}
