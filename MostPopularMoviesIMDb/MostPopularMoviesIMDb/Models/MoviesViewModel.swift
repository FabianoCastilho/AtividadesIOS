//
//  MoviesViewModel.swift
//  MostPopularMoviesIMDb
//
//  Created by user226746 on 10/4/22.
//

import Foundation

class MoviesViewModel : ObservableObject{
    
    @Published var items: [MostPopularDataDetail] = []
        
    init(){
        fetchMovies()
    }
    
    func fetchMovies() {
        guard let url = URL(string: "https://imdb-api.com/en/API/MostPopularMovies/k_04g07by9")
        else {
            print("URL NOT FOUND")
            return
        }
        URLSession.shared.dataTask(with: url){ (data, res, error) in
            if error != nil {
                print("error \(error!)")
                return
            }
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(MostPopularData.self, from: data)
                    self.items = result.items
                    
                }
            }
            catch {
                print("fetch error")
            }
        }.resume()
    }
}
