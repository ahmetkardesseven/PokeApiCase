//
//  PokemonModel.swift
//  PokemanApiCase
//
//  Created by ahmet kardesseven on 3.05.2023.
//

import Foundation

class Pokemon {
    let name: String
    let url: URL
    
    var imageUrl: URL {
        let id = url.lastPathComponent
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")!
    }
    
    var abilityNames = [String]() // Yeni bir dizi ekle
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
}

class PokemonDetail {
    let name: String
    let imageUrl: URL
    let abilityNames: [String] // Yeni bir dizi ekle
    
    init(name: String, imageUrl: URL, abilityNames: [String]) {
        self.name = name
        self.imageUrl = imageUrl
        self.abilityNames = abilityNames
    }
}
