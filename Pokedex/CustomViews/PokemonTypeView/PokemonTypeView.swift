//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Juliano Nardon on 12/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTypeView: UIView {
    
    let nibName = "PokemonTypeView"
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func config(type: PokemonType) {
        self.typeImageView.image = type.icon
        self.typeLabel.text = type.rawValue.uppercased()
        self.contentView.backgroundColor = type.color
    }
}

