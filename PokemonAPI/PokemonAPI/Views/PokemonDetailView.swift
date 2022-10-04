//
//  PokemonDetailView.swift
//  PokemonAPI
//
//  Created by user226746 on 10/3/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @State var pokemon : PokemonModel = PokemonModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Text(pokemon.name.prefix(1).uppercased() + pokemon.name.dropFirst())
                    .editTextLargeTitle(y: 85)
            }
            VStack{
                AsyncImage(url: URL(string: pokemon.sprites.other.artWork.front_default) ) {image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }placeholder: {
                    Color(.green)
                }
            } .frame(width: 200, height: 200, alignment: .top)
                .background(Color(.white))
                .cornerRadius(20)
                .offset(y:-60)
            
            VStack{
                Text("Habilidades")
                    .editTextTitle(.title2, .mint)
                    .padding()
                ForEach(pokemon.abilities, id: \.ability.name){ item in
                    Text("\(item.ability.name)")
                        .editTextTitle(.title3, .blue)
                }
            }
        }
    }
}
struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView().environmentObject(PokemonsViewModel())
    }
}
