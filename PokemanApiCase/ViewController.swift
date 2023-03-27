//
//  ViewController.swift
//  PokemanApiCase
//
//  Created by ahmet kardesseven on 27.03.2023.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var pokemons = [Pokemon]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // UITableView özelliklerinin ayarlanması
            tableView.dataSource = self
            tableView.delegate = self
            
            // PokeAPI'nin Pokemon özelliğine istek yapmak için gerekli URL
            let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=30")!
            
            // Alamofire kullanarak API çağrısı yapmak
            AF.request(url).responseJSON { response in
                switch response.result {
                case .success(let data):
                    if let json = data as? [String: Any], let results = json["results"] as? [[String: Any]] {
                        for pokemon in results {
                            if let name = pokemon["name"] as? String, let urlStr = pokemon["url"] as? String, let url = URL(string: urlStr) {
                                // Pokemon nesnesi oluşturulması
                                let newPokemon = Pokemon(name: name, url: url)
                                self.pokemons.append(newPokemon)
                            }
                        }
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print("Hata: \(error.localizedDescription)")
                }
            }
        }
        
        // UITableView veri kaynağı protokolünden gelen fonksiyonlar
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pokemons.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as! PokemonTableViewCell
            
            // Pokemon nesnesinin alınması
            let pokemon = pokemons[indexPath.row]
            
            // Custom cell'in ayarlanması
            cell.pokemonNameLabel.text = pokemon.name.capitalized
            cell.pokemonImageView.kf.setImage(with: pokemon.imageUrl)
            
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedPokemon = pokemons[indexPath.row]
            let pokemonDetail = PokemonDetail(name: selectedPokemon.name, imageUrl: selectedPokemon.imageUrl)
            performSegue(withIdentifier: "showDetailSegue", sender: pokemonDetail)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetailSegue" {
                if let detailVC = segue.destination as? DetailViewController, let pokemonDetail = sender as? PokemonDetail {
                    detailVC.pokemonDetail = pokemonDetail
                }
            }
        }
   
    
    }
// Pokemon model sınıfı
class Pokemon {
    let name: String
    let url: URL
    
    var imageUrl: URL {
        // Pokemon resmi URL'sinin oluşturulması
        let id = url.lastPathComponent
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")!
    }
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
}
