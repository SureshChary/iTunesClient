//
//  MediaTypesInteractor.swift
//  iTunesClient
//
//  Created by safwan on 22/03/2022.
//

import Foundation

protocol MediaTypesInteractor: AnyObject {
    func viewDidLoad()
    func doneButtonTapped(mediaTypes: [MediaTypes])
}

class MediaTypesInteractorImplementation: MediaTypesInteractor {

    var presenter: MediaTypesPresenter?

    private let media: [MediaTypes] = [MediaTypes.album, MediaTypes.artist,
                                       MediaTypes.book, MediaTypes.movie,
                                       MediaTypes.musicVideo, MediaTypes.song]

    func viewDidLoad() {
        presenter?.interactor(mediaTypes: media)
    }
    func submitButtonTapped(mediaTypes: [MediaTypes]) {

    }
    func doneButtonTapped(mediaTypes: [MediaTypes]) {
        presenter?.interactor(selectedMediaTypes: mediaTypes)
    }
}
