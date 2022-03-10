//
//  ViewModel.swift
//  NewsApp
//
//  Created by Neha Vishnoi on 10/03/22.
//

import Foundation
protocol ViewModelProtocol: AnyObject {
    func didRecieveNewsList(newsList: [News])
}

class ViewModel {
    private let service = Service()
    weak var delegate: ViewModelProtocol?
    func getNewsList() {
        service.getNewsList(urlString: Constant.URL) { [weak self] newsList in
            guard let self = self else { return }
            self.delegate?.didRecieveNewsList(newsList: newsList)
        }
    }
    
    func getImage(urlString: String, imageData: @escaping (Data?) -> Void) {
        service.downloadImage(urlString: urlString) { data in
            imageData(data)
        }
    }
}
