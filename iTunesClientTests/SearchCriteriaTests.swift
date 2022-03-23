//
//  SearchCriteriaTests.swift
//  iTunesClientTests
//
//  Created by safwan on 23/03/2022.
//

import XCTest
@testable import iTunesClient
class SearchCriteriaPresenterMock: SearchCriteriaPresenter {
    private(set) var searchTerm: String = ""
    private(set) var errorMessage: String = ""
    var viewController: SearchCriteriaPresenterOutput?

    func interactorViewDidLoad() {
    }
    func navigateToMediaypeScreen() {
    }

    func navigateToSearchResultScreen(searchTerm: String, mediaTypes: [MediaTypes]) {
        self.searchTerm = searchTerm
    }

    func showErrorAler(message: String) {
        self.errorMessage = message
    }
}

class SearchCriteriaTests: XCTestCase {

    let errorMessage = "Error Message"
    let searchTerm = "searchTerm Message"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchCriteriaScreen() {
        let searchCriteria = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:
                                        "SearchCriteriaViewController") as? SearchCriteriaViewController
        searchCriteria?.loadViewIfNeeded()
        XCTAssertNotNil(searchCriteria, "searchCriteria VC not nil")
    }
    func testSearchTermTextField() {
        let searchCriteria = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:
                                        "SearchCriteriaViewController") as? SearchCriteriaViewController
        searchCriteria?.loadViewIfNeeded()
        XCTAssertNotNil(searchCriteria?.searchTermTextField, "searchTermTextField is not nil")
    }

    func testSearchMediaTypesTextView() {
        let searchCriteria = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:
                                        "SearchCriteriaViewController") as? SearchCriteriaViewController
        searchCriteria?.loadViewIfNeeded()
        XCTAssertNotNil(searchCriteria?.searchMediaTypesTextView, "searchMediaTypesTextView is not nil")
    }

    func testSearchCriteriaSelectedMediaType() {
        let searchCriteria = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier:
                                        "SearchCriteriaViewController") as? SearchCriteriaViewController
        searchCriteria?.loadViewIfNeeded()
        searchCriteria?.selecetdMedia = [MediaTypes.album, MediaTypes.artist]
        XCTAssertEqual(searchCriteria?.selecetdMedia.count, 2, "assigned media count is matching with given count")
    }

    func testSearchCriteriaPresenterMockSeachTerm() {
        let given = "waka"
        let presenterMock = SearchCriteriaPresenterMock()
        presenterMock.navigateToSearchResultScreen(searchTerm: given, mediaTypes: [])
        XCTAssertEqual(presenterMock.searchTerm, "waka",
                       "Assigned search term name is matching with given search term i.e waka")
    }

    func testSearchCriteriaPresenterMockeErrorMessage() {
        let given = "Search results are empty, try with different search criteria"
        let presenterMock = SearchCriteriaPresenterMock()
        presenterMock.showErrorAler(message: given)
        XCTAssertEqual(presenterMock.errorMessage, "Search results are empty, try with different search criteria",
                       "given and errorMessage are same")
    }
    func testSearchCriteriaPresenterForErrorMessage() {
        let presenter = SearchCriteriaPresenterImplementation()
        presenter.viewController = self
        presenter.showErrorAler(message: errorMessage)
    }

    func testSearchCriteriaPresenterForSearchTerm() {
        let presenter = SearchCriteriaPresenterImplementation()
        presenter.viewController = self
        presenter.navigateToSearchResultScreen(searchTerm: searchTerm, mediaTypes: [])
    }
}

extension SearchCriteriaTests: SearchCriteriaPresenterOutput {
    func selectedMediaTypes(mediaTypes: [MediaTypes]) {

    }

    func navigateToMediaypeScreen() {

    }

    func navigateToSearchResultScreen(searchTerm: String, mediaTypes: [MediaTypes]) {
        XCTAssertEqual(searchTerm, searchTerm, "Assigned searchTerm is matching with given search term message")

    }

    func showValidationAlert(message: String) {
        print("calling -- SearchCriteriaPresenterOutput")

        XCTAssertEqual(message, errorMessage, "Assigned errorMessage is matching with given error message")
    }
}
