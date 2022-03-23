//
//  ResultModel.swift
//  iTunesClient
//
//  Created by safwan on 22/03/2022.
//

import Foundation
struct ResultModel: Codable {
    let resultCount: Int?
    let results: [Results]?

//    enum CodingKeys: String, CodingKey {
//
//        case resultCount = "resultCount"
//        case results = "results"
//    }
    struct Results: Codable {
        let wrapperType: String?
        let kind: KindType?
        let artistId: Int?
        let collectionId: Int?
        let trackId: Int?
        let artistName: String?
        let collectionName: String?
        let trackName: String?
        let collectionCensoredName: String?
        let trackCensoredName: String?
        let artistViewUrl: String?
        let collectionViewUrl: String?
        let trackViewUrl: String?
        let previewUrl: String?
        let artworkUrl30: String?
        let artworkUrl60: String?
        let artworkUrl100: String?
        let collectionPrice: Double?
        let trackPrice: Double?
        let releaseDate: String?
        let collectionExplicitness: String?
        let trackExplicitness: String?
        let discCount: Int?
        let discNumber: Int?
        let trackCount: Int?
        let trackNumber: Int?
        let trackTimeMillis: Int?
        let country: String?
        let currency: String?
        let primaryGenreName: String?
        let isStreamable: Bool?

//        enum CodingKeys: String, CodingKey {
//
//            case wrapperType = "wrapperType"
//            case kind = "kind"
//            case artistId = "artistId"
//            case collectionId = "collectionId"
//            case trackId = "trackId"
//            case artistName = "artistName"
//            case collectionName = "collectionName"
//            case trackName = "trackName"
//            case collectionCensoredName = "collectionCensoredName"
//            case trackCensoredName = "trackCensoredName"
//            case artistViewUrl = "artistViewUrl"
//            case collectionViewUrl = "collectionViewUrl"
//            case trackViewUrl = "trackViewUrl"
//            case previewUrl = "previewUrl"
//            case artworkUrl30 = "artworkUrl30"
//            case artworkUrl60 = "artworkUrl60"
//            case artworkUrl100 = "artworkUrl100"
//            case collectionPrice = "collectionPrice"
//            case trackPrice = "trackPrice"
//            case releaseDate = "releaseDate"
//            case collectionExplicitness = "collectionExplicitness"
//            case trackExplicitness = "trackExplicitness"
//            case discCount = "discCount"
//            case discNumber = "discNumber"
//            case trackCount = "trackCount"
//            case trackNumber = "trackNumber"
//            case trackTimeMillis = "trackTimeMillis"
//            case country = "country"
//            case currency = "currency"
//            case primaryGenreName = "primaryGenreName"
//            case isStreamable = "isStreamable"
//        }

    }
}

struct ResultErrorModel: Codable {
    let errorMessage: String?
    let queryParameters: QueryParameters?

//    enum CodingKeys: String, CodingKey {
//
//        case errorMessage = "errorMessage"
//        case queryParameters = "queryParameters"
//    }
    struct QueryParameters: Codable {
        let output: String?
        let callback: String?
        let country: String?
        let limit: String?
        let term: String?
        let lang: String?

//        enum CodingKeys: String, CodingKey {
//
//            case output = "output"
//            case callback = "callback"
//            case country = "country"
//            case limit = "limit"
//            case term = "term"
//            case lang = "lang"
//        }

    }

}
