//
//  Service.swift
//  NewsApp
//
//  Created by Neha Vishnoi on 10/03/22.
//

import Foundation

class Service {
    func getNewsList( urlString: String, newsResponse: @escaping ([News])-> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let urlSession = URLSession.shared
        let request = URLRequest(url: url)
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            if error == nil {
                let decoder = JSONDecoder()
                if let data = data {
                    if let newsList = try? decoder.decode(NewsList.self, from: data) {
                        newsResponse(newsList.articles ?? [])
                    }
                }
            } else {
                newsResponse([])
            }
        }
        dataTask.resume()
    }
    
    func downloadImage(urlString: String, callback: @escaping (Data?)-> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let urlSession = URLSession.shared
        let request = URLRequest(url: url)
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            if error == nil, let data = data {
               callback(data)
            } else {
               callback(nil)
            }
        }
        dataTask.resume()
    }
}
