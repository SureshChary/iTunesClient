//
//  MediaTypesPresenter.swift
//  iTunesClient
//
//  Created by safwan on 22/03/2022.
//

import Foundation
protocol MediaTypesPresenter: AnyObject {
    func interactor(mediaTypes: [MediaTypes])
    func interactor(selectedMediaTypes: [MediaTypes])

}

class MediaTypesPresenterImplementation: MediaTypesPresenter {

    var viewController: MediaTypesPresenterOutput?

    func interactor(mediaTypes: [MediaTypes]) {
        viewController?.presenter(mediaTypes: mediaTypes)
    }
    func interactor(selectedMediaTypes: [MediaTypes]) {
        viewController?.routeToSearchCriteriaScreenWith(selectedMediaTypes: selectedMediaTypes)
    }
}
