//
//  MoviesDetailView.swift
//  MostPopularMoviesIMDb
//
//  Created by user226746 on 10/5/22.
//

import SwiftUI

struct MoviesDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State var movie : MostPopularDataDetail

    var body: some View {
        VStack{
            HStack{
                Text(movie.title)
                    .editTextLargeTitle(y: 85)
            }
            VStack{
                AsyncImage(url: URL(string: movie.image) ) {image in
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
                Text("Information")
                    .editTextTitle(.title2, .mint)
                    .padding()
               
                Text("Rank: \(movie.rank)")
                        .editTextTitle(.title3, .blue)
                
                Text("Year: \(movie.year)")
                         .editTextTitle(.title3, .blue)
                
                Text("Crew: \(movie.crew)")
                         .editTextTitle(.title3, .blue)
                
            }
        }
    }
}


