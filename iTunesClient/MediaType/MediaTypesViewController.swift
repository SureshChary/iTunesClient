//
//  MediaTypesViewController.swift
//  iTunesClient
//
//  Created by safwan on 21/03/2022.
//

import UIKit

protocol MediaTypesPresenterOutput: AnyObject {
    func presenter(mediaTypes: [MediaTypes])
    func routeToSearchCriteriaScreenWith(selectedMediaTypes: [MediaTypes])
}

class MediaTypesViewController: UIViewController {
    // MARK: - UI Outlets
    @IBOutlet weak var mediaTypesTable: UITableView!

    // MARK: - Properties
    var interactor: MediaTypesInteractorImplementation?
    var router: MediaTypesRouterImplementation?

    // MARK: - States
    var media: [MediaTypes] = []
    var selecetdMedia: [MediaTypes] = []
    weak var mediaTypeDelegate: SearchCriteriaPresenterOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIPFlow()
        interactor?.viewDidLoad()
    }

    // MARK: Setup
    private func setupVIPFlow() {
        let router = MediaTypesRouterImplementation()
        let interactor = MediaTypesInteractorImplementation()
        let presenter = MediaTypesPresenterImplementation()
        self.router = router
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }

    @IBAction func doneBarButtonAction(_ sender: Any) {
        interactor?.doneButtonTapped(mediaTypes: selecetdMedia)
    }

}
extension MediaTypesViewController: MediaTypesPresenterOutput {
    func routeToSearchCriteriaScreenWith(selectedMediaTypes: [MediaTypes]) {
        mediaTypeDelegate?.selectedMediaTypes(mediaTypes: selectedMediaTypes)
        self.navigationController?.popViewController(animated: true)
    }

    func presenter(mediaTypes: [MediaTypes]) {
        self.media = mediaTypes
        self.mediaTypesTable.reloadData()
    }
}
extension MediaTypesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel!.textColor = .white
        cell.textLabel!.text = media[indexPath.row].description
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }

        let selectedRowMediaType = media[indexPath.row]
        if selecetdMedia.contains(selectedRowMediaType) {
            cell.accessoryType = .none
            if let index = selecetdMedia.firstIndex(of: selectedRowMediaType) {
                selecetdMedia.remove(at: index)
            }
        } else {
            cell.accessoryType = .checkmark
            selecetdMedia.append(selectedRowMediaType)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
    }
}
