//
//  ContentView.swift
//  MostPopularMoviesIMDb
//
//  Created by user226746 on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : MoviesViewModel
    
    var body: some View {
        VStack{
            Text(" Top 250 Movies")
                .editTextLargeTitle(y: 0.1)
            NavigationView{
                List{
                    ForEach(viewModel.items, id: \.id) {item in
                        NavigationLink(destination: MoviesDetailView(movie: item), label: {
                            HStack {
                                AsyncImage(url: URL(string: item.image)) {image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 75, height: 60)
                                        .aspectRatio(contentMode: .fill)
                                }placeholder: {
                                    Color(.green) }
                                Text("\(item.title)")
                                    .editTextTitle(.title3, .black)
                            }
                            .padding()
                        })
                    }
                }.listStyle(.plain)
            }
            VStack{
                Text("Erro Api: ")
                    .font(.title3)
                Text("\(viewModel.mostPopularData.errorMessage)")
                    .font(.title3)
            }  .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MoviesViewModel())
    }
}
