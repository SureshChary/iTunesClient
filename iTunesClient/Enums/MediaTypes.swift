//
//  MediaTypes.swift
//  iTunesClient
//
//  Created by safwan on 22/03/2022.
//

import Foundation
// ["Album", "Artist", "Book", "Movie", "MusicVideo", "Podcast", "Song"]
public enum MediaTypes: String {
    case album, artist, book, movie, musicVideo, podcast, song

    public var description: String {
        switch self {
        case .album:
            return "Album"
        case .artist:
            return "Artist"
        case .book:
            return "Book"
        case .movie:
            return "Movie"
        case .musicVideo:
            return "Music Video"
        case .podcast:
            return "Podcast"
        case .song:
            return "Song"
        }
    }
    public var apiKey: String {
        switch self {
        case .album:
            return "album"
        case .artist:
            return "artist"
        case .book:
            return "book"
        case .movie:
            return "movie"
        case .musicVideo:
            return "musicVideo"
        case .podcast:
            return "podcast"
        case .song:
            return "song"
        }
    }
    public var kindKey: String {
        switch self {
        case .album:
            return "album"
        case .artist:
            return "artist"
        case .book:
            return "book"
        case .movie:
            return "movie"
        case .musicVideo:
            return "music-video"
        case .podcast:
            return "podcast"
        case .song:
            return "song"
        }
    }
}
