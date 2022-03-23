//
//  SearchCriteriaRouter.swift
//  iTunesClient
//
//  Created by safwan on 23/03/2022.
//

import Foundation
import UIKit

protocol SearchCriteriaRouter {
    var navigationController: UINavigationController? { get }
    func navigateToSearchResultScreen(searchTerm: String, mediaTypes: [MediaTypes])
    func navigateToMediaTypetScreen()
}

class SearchCriteriaRouterImplementation: SearchCriteriaRouter {
    var navigationController: UINavigationController?

    func navigateToSearchResultScreen(searchTerm: String, mediaTypes: [MediaTypes]) {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:
                                        "SearchResultViewController") as? SearchResultViewController
        if let viewController = viewController {
            viewController.intent = SearchResultIntent(searchTerm: searchTerm, mediaTypes: mediaTypes)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

    func navigateToMediaTypetScreen() {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:
                                        "MediaTypesViewController") as? MediaTypesViewController
        if let viewController = viewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
