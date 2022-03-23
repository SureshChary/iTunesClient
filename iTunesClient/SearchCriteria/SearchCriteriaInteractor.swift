//
//  SearchCriteriaInteractor.swift
//  iTunesClient
//
//  Created by safwan on 23/03/2022.
//

import Foundation
protocol SearchCriteriaInteractor: AnyObject {
    func viewDidLoad()
    func navigateToMediaypeScreen()
    func submitButtonTapped(searchTerm: String, mediaTypes: [MediaTypes])
}

class SearchCriteriaInteractorImplementation: SearchCriteriaInteractor {

    var presenter: SearchCriteriaPresenter?
    func viewDidLoad() {
        presenter?.interactorViewDidLoad()
    }
    func navigateToMediaypeScreen() {
        presenter?.navigateToMediaypeScreen()
    }
    func submitButtonTapped(searchTerm: String, mediaTypes: [MediaTypes]) {
        if searchTerm.isEmpty {
            presenter?.showErrorAler(message: "Please enter search term")
        } else if mediaTypes.count == 0 {
            presenter?.showErrorAler(message: "Please select atleast one media type")
        } else {
            presenter?.navigateToSearchResultScreen(searchTerm: searchTerm, mediaTypes: mediaTypes)
        }
    }
}
