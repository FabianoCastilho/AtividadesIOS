//
//  PokemonModel.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//

import Foundation

struct PokemonModel : Codable{
    var abilities : [Abilities] = []
    var name : String = ""
    var order : Int = 0
    var sprites : Sprites = Sprites()
}

struct Abilities : Codable{
    var ability : Ability = Ability()
}

struct Ability :Codable{
    var name : String = ""
}
struct Sprites : Codable{
    var front_default : String = ""
    var other : OfficialArtWork = OfficialArtWork()
}
struct OfficialArtWork : Codable{
    var artWork : FrontDefault = FrontDefault()
    private enum CodingKeys: String, CodingKey {
        case artWork = "official-artwork"
    }
}
struct FrontDefault: Codable{
    var front_default : String = ""
}
