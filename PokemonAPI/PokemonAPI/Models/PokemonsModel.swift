//
//  PokeResultModel.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//

import Foundation

struct PokeModel : Codable{
    var name : String
    var url : String
}
struct PokeResult : Codable{
    var count : Int
    var results : [PokeModel] = []
}
