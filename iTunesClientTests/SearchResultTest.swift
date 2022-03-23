//
//  SearchResultTest.swift
//  iTunesClientTests
//
//  Created by safwan on 23/03/2022.
//

import XCTest
@testable import iTunesClient

class SearchResultPresenterMock: SearchResultPresenter {
    private(set) var headerName: String = ""

    func interactorViewDidLoad(results: [ResultDataModel]) {
        headerName = results.first?.headerName ?? ""
    }
}
class SearchResultInteractorMock: SearchResultInteractor {
    private(set) var searchTerm: String = ""
    private(set) var mediaTypes: [MediaTypes] = []

    func viewDidLoad(intent: SearchResultIntent) {
        searchTerm = intent.searchTerm
        mediaTypes = intent.mediaTypes
    }
}

class SearchResultTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testSearchResultScreen() {
        let searchResult = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:
                                        "SearchResultViewController") as? SearchResultViewController
        searchResult?.loadViewIfNeeded()
        XCTAssertNotNil(searchResult, "searchResult VC not nil")
    }

    func testSearchResultPresenterMock() {
        let given = [ResultDataModel(headerName: "Album", results: [])]
        let presenter = SearchResultPresenterMock()
        presenter.interactorViewDidLoad(results: given)
        XCTAssertEqual(presenter.headerName, "Album", "assigned album name is matching with given name i.e Album")

    }

    func testSearchResultInteractorMock() {
        let given = SearchResultIntent.init(searchTerm: "waka", mediaTypes: [MediaTypes.song])
        let interactor = SearchResultInteractorMock()
        interactor.viewDidLoad(intent: given)
        XCTAssertEqual(interactor.searchTerm, "waka",
                       "Assigned search term name is matching with given search term i.e waka")
        XCTAssertEqual(interactor.mediaTypes.count, 1,
                       "Assigned media type array count is matching with given count i.e 1")
    }

    func testSearchCriteriaPresenterForSearchTerm() {
        let presenter = SearchResultPresenterImplementation()
        presenter.viewController = self
        presenter.interactorViewDidLoad(results: [ResultDataModel(headerName: "Songs", results: [])])
    }
}

extension SearchResultTest: SearchResultPresenterOutput {
    func presenterViewDidLoad(results: [ResultDataModel]) {
        print("calling -- SearchResultPresenterOutput")
        XCTAssertEqual(results.first?.headerName, "Songs",
                       "Assigned and given are matching")
    }

    func showErrorAler(message: String) {
        XCTAssertEqual(message, "Search results are empty, try with different search criteria",
                       "Assigned and given are matching")
    }

}
