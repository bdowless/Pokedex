//
//  PokemonObject.swift
//  21
//
//  Created by Brandon Dowless on 11/5/21.
//

import UIKit

struct Pokemon: Decodable {
    
        let attack: Int
        let defense: Int
        let description: String
        let height: Int
        let id: Int
        let imageUrl: String
        let name: String
        let type: String
        let weight: Int


}

