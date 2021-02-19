//
//  GameListVC.swift
//  Gamy
//
//  Created by Ariel on 04/11/20.
//

import UIKit
import os.log

protocol GameListDisplayLogic: class {
    func listResult(result: Result<GameList.ViewModel, Error>)
}

class GameListVC: UIViewController, GameListDisplayLogic {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var router: (NSObjectProtocol & GameListRoutingLogic & GameListDataPassing)?
    private var interactor: GameListBussinessLogic?
    private var page = 1
    var viewModel: GameList.ViewModel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = GameListInteractor()
        let presenter = GameListPresenter()
        let router = GameListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewList = viewController
        router.viewList = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Find a game..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GameListCell", bundle: nil), forCellReuseIdentifier: "GameListCell")
        
        ActivityIndicator.start(on: self)
        interactor?.requestList(page: page)
        ActivityIndicator.stop(on: self)
    }
    
    func listResult(result: Result<GameList.ViewModel, Error>) {
        switch result {
        case .success(let viewModel):
            self.viewModel = viewModel
            tableView.reloadData()
        case .failure(let error):
            Alert.showErrorDialog(on: self, with: error as! BaseError)
        }
    }
}

extension GameListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // guard let text = searchController.searchBar.text else { return }
        // ActivityIndicator.start(on: self)
        // interactor?.requestSearch(keyword: text)
        // ActivityIndicator.stop(on: self)
        Alert.showBasicDialog(on: self, with: "Sorry", message: "We still have some problem with URL Session. This feature is undermaintenance")
    }
}


extension GameListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = viewModel {
            return data.game.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameListCell", for: indexPath) as! GameListCell
        cell.setupGame(data: viewModel.game[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail(segue: nil)
    }
}
