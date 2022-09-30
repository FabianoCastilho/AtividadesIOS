//
//  PokemonModel.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//

import Foundation

struct PokemonModel : Codable{
    var name : String = ""
    var order : Int = 0
    var abilities : [Abilities] = []
    var sprities : Sprites = Sprites()
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
    var officialArtWork : FrontDefault = FrontDefault()
}
struct FrontDefault: Codable{
    var front_default : String = ""
}
