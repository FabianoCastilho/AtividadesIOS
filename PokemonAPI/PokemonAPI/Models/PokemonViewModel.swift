//
//  PokemonViewModel.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//

import Foundation

class PokemonViewModel : ObservableObject {
    
    @Published var pokemon : PokemonModel = PokemonModel()
    
    func fechPokemon(urlSpr : String) {
        guard let url = URL (string: urlSpr) else {
            print("Url not found")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil{
                print("\(error!)")
                return
            }
        
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(PokemonModel.self, from: data)
                    self.pokemon = result
                }
            }
            catch {
                print("Error fetch Json pokemon")
            }
        }
        .resume()
    }
}
