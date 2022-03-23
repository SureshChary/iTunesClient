//
//  SearchResultViewController.swift
//  iTunesClient
//
//  Created by safwan on 20/03/2022.
//

import UIKit
protocol SearchResultPresenterOutput: AnyObject {
    func presenterViewDidLoad(results: [ResultDataModel])
    func showErrorAler(message: String)
}

class SearchResultViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var listGridSegmentControl: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!

    // MARK: - States
    var gridFlowLayout = GridFlowLayout()
    var listFlowLayout = ListFlowLayout()
    var isGridFlowLayoutUsed: Bool = false {
        didSet {
            updateButtonAppearance()
        }
    }
    var resultDataModel: [ResultDataModel] = []

    // MARK: - intent
    var intent: SearchResultIntent?

    // MARK: - Properties
    var interactor: SearchResultInteractorImplementation?
    var router: SearchResultRouterImplementation?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupVIPFlow()
        setUpCollectionView()
        isGridFlowLayoutUsed = true

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let logo = UIImage(named: "itunesIcon")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        if let intent = intent {
            self.view.activityStartAnimating(activityColor: .white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
            interactor?.viewDidLoad(intent: intent)
        }
    }
    // MARK: Setup
    private func setupVIPFlow() {
        let router = SearchResultRouterImplementation()
        let interactor = SearchResultInteractorImplementation()
        let presenter = SearchResultPresenterImplementation()
        self.router = router
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }

    fileprivate func setUpCollectionView() {
        self.collectionView.register(UINib(nibName: "ResultCollectionViewCell",
                                           bundle: Bundle.main), forCellWithReuseIdentifier: "resultCell")
        self.collectionView.register(UINib(nibName: "CollectionHeaderView",
                                           bundle: nil),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                     withReuseIdentifier: "headerView")
        collectionView.collectionViewLayout = gridFlowLayout
        collectionView.dataSource = self
    }
    @IBAction func listGridSegmentControlAction(_ sender: UISegmentedControl) {
        isGridFlowLayoutUsed = sender.selectedSegmentIndex == 0
    }
    fileprivate func updateButtonAppearance() {
        let layout = isGridFlowLayoutUsed ? gridFlowLayout : listFlowLayout
        layout.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 50)
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.setCollectionViewLayout(layout, animated: true)
        }
    }
}

extension SearchResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultDataModel[section].results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt
                        indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell",
                                                      for: indexPath) as? ResultCollectionViewCell
        let imageUrl = resultDataModel[indexPath.section].results[indexPath.row].artworkUrl100 ?? ""
        cell?.resultImage.loadImageUsingCache(withUrl: imageUrl)
        cell?.resultName.text = resultDataModel[indexPath.section].results[indexPath.row].artistName
        return cell!

    }

    // Header
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return resultDataModel.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind
                        kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind:
                                                                            kind, withReuseIdentifier: "headerView",
                                                                         for: indexPath) as? CollectionHeaderView
        headerView?.headerName.text = resultDataModel[indexPath.section].headerName
        headerView?.frame.size.height = 50
        headerView?.frame.size.width = collectionView.frame.width
        return headerView!
    }
}

extension SearchResultViewController: SearchResultPresenterOutput {
    func showErrorAler(message: String) {
        DispatchQueue.main.async {
            self.view.activityStopAnimating()
            self.showError(with: message)
        }
    }

    func presenterViewDidLoad(results: [ResultDataModel]) {
        self.resultDataModel = results
        DispatchQueue.main.async {
            self.view.activityStopAnimating()
            self.collectionView.reloadData()
        }
    }
}
