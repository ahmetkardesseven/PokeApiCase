//
//  DetailViewController.swift
//  PokemanApiCase
//
//  Created by ahmet kardesseven on 27.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

   
    @IBOutlet weak var pokemonAbilityLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
       @IBOutlet weak var pokemonImageView: UIImageView!
       
       var pokemonDetail: PokemonDetail?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Pokemon detaylarının gösterilmesi
           if let pokemonDetail = pokemonDetail {
               pokemonNameLabel.text = pokemonDetail.name.capitalized
               pokemonImageView.kf.setImage(with: pokemonDetail.imageUrl)
               pokemonAbilityLabel.text = pokemonDetail.abilityNames.joined(separator: ",").capitalized
               
           }
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
