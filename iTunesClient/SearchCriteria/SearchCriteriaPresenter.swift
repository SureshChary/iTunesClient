//
//  SearchCriteriaPresenter.swift
//  iTunesClient
//
//  Created by safwan on 23/03/2022.
//

import Foundation
protocol SearchCriteriaPresenter: AnyObject {
    func interactorViewDidLoad()
    func navigateToMediaypeScreen()
    func navigateToSearchResultScreen(searchTerm: String, mediaTypes: [MediaTypes])
    func showErrorAler(message: String)
}

class SearchCriteriaPresenterImplementation: SearchCriteriaPresenter {

    var viewController: SearchCriteriaPresenterOutput?

    func interactorViewDidLoad() {
    }

    func navigateToMediaypeScreen() {
        viewController?.navigateToMediaypeScreen()
    }
    func showErrorAler(message: String) {
        viewController?.showValidationAlert(message: message)
    }
    func navigateToSearchResultScreen(searchTerm: String, mediaTypes: [MediaTypes]) {
        viewController?.navigateToSearchResultScreen(searchTerm: searchTerm, mediaTypes: mediaTypes)
    }
}
