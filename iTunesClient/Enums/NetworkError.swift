//
//  NetworkError.swift
//  iTunesClient
//
//  Created by safwan on 22/03/2022.
//

import Foundation

enum NetworkError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
