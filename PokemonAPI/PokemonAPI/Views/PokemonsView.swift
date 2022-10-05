//
//  PokemonsView.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//

import SwiftUI

struct PokemonsView: View {
    @EnvironmentObject var viewModel : PokemonsViewModel
   
    @Binding var limit: Int
    @Binding var offset: Int
    @Binding var isAddView : Bool
   
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(Array(viewModel.pokemonsDetail.enumerated()), id: \.offset){index, pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon), label: {
                            HStack {
                                AsyncImage(url: URL(string: pokemon.sprites.front_default))
                                    .frame(width: 60, height: 45)
                                    .padding()
                                Text("\(pokemon.name)")
                                    .editTextTitle(.title3, .blue)
                            }
                            .padding()
                        })
                    }
                }.listStyle(.plain)
                .toolbar{ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        if offset < limit {
                            offset = 0
                            viewModel.fetchPokemons(limit, offset)
                        }else{
                            offset -= limit
                            viewModel.fetchPokemons(limit, offset)
                        }
                    }, label: { Label(
                        "", systemImage: "chevron.backward.2")
                    })
                    Spacer()
                }}
                .toolbar{ToolbarItem (placement: .navigationBarTrailing) {
                    Button(action: {
                        offset += limit
                        viewModel.fetchPokemons(limit, offset)
                        }, label: { Label(
                        "", systemImage: "chevron.forward.2")
                        })
                    }
                }
                Button("Close"){
                    isAddView = false
                }
                .editButton(color: .red)
            }
        }
    }
}


