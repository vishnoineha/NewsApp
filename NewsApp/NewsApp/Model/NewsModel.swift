//
//  NewsModel.swift
//  NewsApp
//
//  Created by Neha Vishnoi on 10/03/22.
//

import Foundation
struct News: Codable {
    var title: String?
    var description : String?
    var urlToImage : String?
}

struct NewsList: Codable {
    var articles: [News]?
}
 
