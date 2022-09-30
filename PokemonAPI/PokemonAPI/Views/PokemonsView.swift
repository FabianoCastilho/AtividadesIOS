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
        HStack{
            Button(action: {
                if offset < limit {
                   offset = 0
                }else{
                    offset -= limit
                }
                viewModel.fetchPokemons(limit, offset)
            }, label: { Label(
                "", systemImage: "chevron.backward.2")
            })
            Spacer()
            Button(action: {
                offset += limit
                viewModel.fetchPokemons(limit, offset)
            }, label: { Label(
                "", systemImage: "chevron.forward.2")
            })
        }
        List{
            ForEach(viewModel.pokemons, id: \.name){poke in
                
                    HStack {
                       
                        Text("\(poke.name)")
                    }
                }
               
            
        }
    }
}


