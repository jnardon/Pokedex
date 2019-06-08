//
//  UIImageViewExtensions.swift
//  Pokedex
//
//  Created by Elias Medeiros on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit
import Nuke

extension UIImage {
    
    static let pikachu = UIImage(named: "pikashadow")!
    
}

extension UIImageView {
    
    func loadImage(from urlString: String) {
        if let url = URL(string: urlString) {
            // simplão
            // Nuke.loadImage(with: url, into: self)

            // bonitão
            let options = ImageLoadingOptions(placeholder: .pikachu, transition: .fadeIn(duration: 0.3), failureImage: .pikachu)
            
            Nuke.loadImage(with: url, options: options, into: self)
        }
        
    }
//
//    func loadImage(from urlString: String) {
//        let imageURL = URL(string: urlString)
//        var image: UIImage?
//        if let url = imageURL {
//            //All network operations has to run on different thread(not on main thread).
//            DispatchQueue.global(qos: .userInitiated).async {
//                let imageData = NSData(contentsOf: url)
//                //All UI operations has to run on main thread.
//                DispatchQueue.main.async {
//                    if imageData != nil {
//                        image = UIImage(data: imageData as! Data)
//                        self.image = image
//                    } else {
//                        image = nil
//                    }
//                }
//            }
//        }
//    }

    
}
