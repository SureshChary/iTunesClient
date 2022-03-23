//
//  SearchResultPresenter.swift
//  iTunesClient
//
//  Created by safwan on 23/03/2022.
//

import Foundation
protocol SearchResultPresenter: AnyObject {
    func interactorViewDidLoad(results: [ResultDataModel])
}

class SearchResultPresenterImplementation: SearchResultPresenter {

    var viewController: SearchResultPresenterOutput?

    func interactorViewDidLoad(results: [ResultDataModel]) {
        if results.count == 0 {
            viewController?.showErrorAler(message: "Search results are empty, try with different search criteria")
        } else {
            viewController?.presenterViewDidLoad(results: results)
        }
    }

}
