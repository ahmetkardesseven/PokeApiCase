//
//  DetailViewController.swift
//  PokemanApiCase
//
//  Created by ahmet kardesseven on 27.03.2023.
//

import UIKit

 final class DetailViewController: UIViewController {

   
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

