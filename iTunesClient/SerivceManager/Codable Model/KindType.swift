//
//  KindType.swift
//  iTunesClient
//
//  Created by safwan on 22/03/2022.
//

import Foundation

public enum KindType: String, Codable {
    case book, album, pdf, podcast, song, artist
    case coachedAudio = "coached-audio"
    case featureMovie = "feature-movie"
    case interactiveBooklet = "interactive-booklet"
    case musicVideo = "music-video"
    case podcastEpisode = "podcast-episode"
    case softwarePackage = "software-package"
    case tvEpisode = "tv-episode"
    case unknown

    public init(from decoder: Decoder) throws {
        self = try KindType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
       }
}
