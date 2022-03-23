//
//  SearchResultInteractor.swift
//  iTunesClient
//
//  Created by safwan on 23/03/2022.
//

import Foundation
struct SearchResultIntent {
    let searchTerm: String
    let mediaTypes: [MediaTypes]
}
struct ResultDataModel {
    let headerName: String
    let results: [ResultModel.Results]
}

protocol SearchResultInteractor: AnyObject {
    func viewDidLoad(intent: SearchResultIntent)
}

class SearchResultInteractorImplementation: SearchResultInteractor {

    var presenter: SearchResultPresenter?
    func viewDidLoad(intent: SearchResultIntent) {

        let term = intent.searchTerm
        let media = intent.mediaTypes.map { $0.apiKey }.joined(separator: "&")
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(term)&entity=\(media)") else { return }

        ServiceManager.sharedInstance.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                guard let resultData = try? JSONDecoder().decode(ResultModel.self, from: data) else { return }

                var resultsTemp: [ResultDataModel] = []
                if let result = resultData.results, result.count > 0 {
                    for media in intent.mediaTypes {
                        let kindData = resultData.results?.filter { $0.kind?.rawValue == media.kindKey}
                        if let kindData = kindData, kindData.count > 0 {
                            resultsTemp.append(ResultDataModel(headerName: media.description, results: kindData))
                        }
                    }
                }
                self.presenter?.interactorViewDidLoad(results: resultsTemp)
            }

        }
    }
}
