//
//  PokeResultModel.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//

import Foundation

struct PokemonsModel : Codable{
    var name : String
    var url : String
}
struct ResultsModel : Codable{
    var count : Int
    var results : [PokemonsModel] = []
}
