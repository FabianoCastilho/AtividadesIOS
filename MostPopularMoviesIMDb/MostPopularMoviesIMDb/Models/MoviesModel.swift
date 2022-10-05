//
//  MoviesModel.swift
//  MostPopularMoviesIMDb
//
//  Created by user226746 on 10/4/22.
//

import Foundation
struct MostPopularData : Codable{
    var items : [MostPopularDataDetail] =  []
    var errorMessage : String = ""
}

struct MostPopularDataDetail : Codable{
    var id : String = ""
    var rank : String = ""
    var rankUpDown : String = ""
    var title : String = ""
    var fullTitle : String = ""
    var year : String = ""
    var image : String = ""
    var crew : String = ""
    var imDbRating : String = ""
    var imDbRatingCount : String = ""
}
