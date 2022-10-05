//
//  ContentView.swift
//  PokemonAPI
//
//  Created by user226746 on 9/30/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : PokemonsViewModel
    @State var limit: Int = 10
    @State var offset: Int = 0
    @State var isAddView : Bool = false
   
    var body: some View {
        NavigationView{
            VStack{
                Text("POKEMONS")
                    .editTextLargeTitle(y: 205)
                VStack{
                    HStack{
                        Text("Limit")
                            .editTextTitle( .title2, .mint)
                        Picker("limit", selection: $limit){
                            ForEach(0 ..< 30){
                                Text("\($0) Pokemons")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 150, height: 50, alignment: .center)
                    }
                    .toolbar{ ToolbarItem(placement: .bottomBar ){
                        Button("Search"){
                            viewModel.fetchPokemons(limit, offset)
                            isAddView = true
                        }
                        .editButton(color: .blue)
                    } }
                    .sheet(isPresented: $isAddView, content:{
                        PokemonsView(limit: $limit, offset: $offset, isAddView: $isAddView)
                    })
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PokemonsViewModel())
    }
}
