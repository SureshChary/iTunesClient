//
//  MediaTypesTest.swift
//  iTunesClientTests
//
//  Created by safwan on 23/03/2022.
//

import XCTest
@testable import iTunesClient

class MediaTypesTest: XCTestCase {

    let givenMediaTypes = [MediaTypes.song, MediaTypes.album, MediaTypes.artist, MediaTypes.musicVideo]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMediaTypesScreen() {
        let mediaTypeVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:
                                        "MediaTypesViewController") as? MediaTypesViewController
        mediaTypeVC?.loadViewIfNeeded()
        XCTAssertNotNil(mediaTypeVC, "mediaType VC not nil")
    }

    func testMediaTypesPresenterForMediatypes() {
        let presenter = MediaTypesPresenterImplementation()
        presenter.viewController = self
        presenter.interactor(mediaTypes: givenMediaTypes)
    }

    func testMediaTypesPresenterForSelectedMediatypes() {
        let presenter = MediaTypesPresenterImplementation()
        presenter.viewController = self
        presenter.interactor(selectedMediaTypes: [MediaTypes.song, MediaTypes.album])
    }
}

extension MediaTypesTest: MediaTypesPresenterOutput {
    func presenter(mediaTypes: [MediaTypes]) {
        XCTAssertEqual(mediaTypes, givenMediaTypes,
                       "Assigned and given are matching")
    }

    func routeToSearchCriteriaScreenWith(selectedMediaTypes: [MediaTypes]) {
        XCTAssertEqual(selectedMediaTypes.count, 2,
                       "Assigned and given are matching")
    }

}
