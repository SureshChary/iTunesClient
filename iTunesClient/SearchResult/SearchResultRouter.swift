//
//  SearchResultRouter.swift
//  iTunesClient
//
//  Created by safwan on 23/03/2022.
//

import Foundation
import UIKit

protocol SearchResultRouter {
    var navigationController: UINavigationController? { get }
}

class SearchResultRouterImplementation: SearchResultRouter {
    var navigationController: UINavigationController?
}
