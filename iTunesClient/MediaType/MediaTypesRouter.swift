//
//  MediaTypesRouter.swift
//  iTunesClient
//
//  Created by safwan on 22/03/2022.
//

import UIKit

protocol MediaTypesRouter {
    var navigationController: UINavigationController? { get }
    func routeToSearchCriteriaScene()
}

class MediaTypesRouterImplementation: MediaTypesRouter {
    func routeToSearchCriteriaScene() {

    }
    var navigationController: UINavigationController?
}
