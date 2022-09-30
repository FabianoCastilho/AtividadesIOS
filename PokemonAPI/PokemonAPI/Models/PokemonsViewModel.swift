//
//  PokemonsViewModel.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//
import Foundation

class PokemonsViewModel : ObservableObject{
  
    @Published var pokemons : [PokemonsModel] = []
    var urlApi : String = "https://pokeapi.co/api/v2/pokemon"
    init(){
        fetchPokemons(10, 0)
    }
    
    func fetchPokemons(_ limit: Int, _ offset: Int){
        guard let url = URL(string: "\(urlApi)?limit=\(limit)&offset=\(offset)")
        else {
            print("URL NOT FOUND")
            return
        }
        URLSession.shared.dataTask(with: url){ (data, res, error) in
            if error != nil {
                print("error \(error!)")
                return
            }
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(ResultsModel.self, from: data)
                    self.pokemons = result.results
                }
            }catch {
                print("fetch error")
            }
        }
        .resume()
    }
  
}
