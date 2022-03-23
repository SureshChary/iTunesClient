//
//  ViewController.swift
//  iTunesClient
//
//  Created by safwan on 20/03/2022.
//

import UIKit
protocol SearchCriteriaPresenterOutput: AnyObject {
   // func presenterViewDidLoad()
    func selectedMediaTypes(mediaTypes: [MediaTypes])
    func navigateToMediaypeScreen()
    func navigateToSearchResultScreen(searchTerm: String, mediaTypes: [MediaTypes])
    func showValidationAlert(message: String)
}

class SearchCriteriaViewController: UIViewController {

    // MARK: - UI Outlets
    @IBOutlet weak var searchTermTextField: UITextField!
    @IBOutlet weak var searchMediaTypesTextView: UITextView!

    // MARK: - Properties
    var interactor: SearchCriteriaInteractorImplementation?
    var router: SearchCriteriaRouterImplementation?

    // MARK: - States
    var selecetdMedia: [MediaTypes] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTermTextField.delegate = self
        setupVIPFlow()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let logo = UIImage(named: "itunesIcon")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
    }

    // MARK: Setup
    private func setupVIPFlow() {
        let router = SearchCriteriaRouterImplementation()
        router.navigationController = self.navigationController
        let interactor = SearchCriteriaInteractorImplementation()
        let presenter = SearchCriteriaPresenterImplementation()
        self.router = router
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MediaTypesVC" {
            if let destinationVC = segue.destination as? MediaTypesViewController {
                destinationVC.mediaTypeDelegate = self
            }
        }
    }

    @IBAction func submitButtonAction(_ sender: Any) {
        interactor?.submitButtonTapped(searchTerm: searchTermTextField.text ?? "", mediaTypes: selecetdMedia)
    }
    @IBAction func selectMediaTypeAction(_ sender: Any) {
        interactor?.navigateToMediaypeScreen()
    }

}

extension SearchCriteriaViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
        return true
    }
}

extension SearchCriteriaViewController: SearchCriteriaPresenterOutput {
    func showValidationAlert(message: String) {
        self.showError(with: message)
    }

    func navigateToMediaypeScreen() {
        self.performSegue(withIdentifier: "MediaTypesVC", sender: nil)
    }
    func navigateToSearchResultScreen(searchTerm: String, mediaTypes: [MediaTypes]) {
        self.router?.navigateToSearchResultScreen(searchTerm: searchTerm, mediaTypes: mediaTypes)
    }

    func selectedMediaTypes(mediaTypes: [MediaTypes]) {
        print("selecetdMedia \(mediaTypes)")
        self.selecetdMedia = mediaTypes
        self.searchMediaTypesTextView.text = mediaTypes.map { $0.description }.joined(separator: ", ")
    }
}
