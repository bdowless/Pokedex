//
//  PokemonObject.swift
//  21
//
//  Created by Brandon Dowless on 11/5/21.
//

import UIKit

struct PokemonObject: Decodable {
    
        var attack: Int
        var defense: Int
        var description: String
        var height: Int
        var id: Int
        var imageUrl: String?
        var name: String
        var type: String
        var weight: Int


}

