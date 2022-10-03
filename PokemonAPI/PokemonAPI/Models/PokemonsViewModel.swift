//
//  PokemonsViewModel.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//
import SwiftUI
import Foundation

class PokemonsViewModel : ObservableObject{
    
    @Published var pokemons : [PokemonsModel] = []
    @Published var pokemon : PokemonModel = PokemonModel()
    @Published var pokemonsDetail : [PokemonModel] = []
    
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
                    
                    self.pokemonsDetail = []
                    self.pokemons.forEach(){pk in
                        self.fechPokemon(urlSpr: pk.url)
                    }
                }
            }catch {
                print("fetch error")
            }
        }
        .resume()
    }
    func fechPokemon(urlSpr : String) {
        guard let url = URL (string: urlSpr) else {
            print("Url not found")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("\(error!)")
                return
            }
        
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(PokemonModel.self, from: data)
                    
                    self.pokemon = result
                    self.pokemonsDetail.append(result)
                }
            }
            catch {
                print("Error fetch Json pokemon")
            }
        }
        .resume()
    }
  
}
