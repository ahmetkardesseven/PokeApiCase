//
//  DetailViewController.swift
//  PokemanApiCase
//
//  Created by ahmet kardesseven on 27.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

   
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
       @IBOutlet weak var pokemonImageView: UIImageView!
       
       var pokemonDetail: PokemonDetail?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Pokemon detaylarının gösterilmesi
           if let pokemonDetail = pokemonDetail {
               pokemonNameLabel.text = pokemonDetail.name
               pokemonImageView.kf.setImage(with: pokemonDetail.imageUrl)
           }
       }
    

    

}
class PokemonDetail {
    let name: String
    let imageUrl: URL
    
    init(name: String, imageUrl: URL) {
        self.name = name
        self.imageUrl = imageUrl
    }

}
