//
//  GameListRouter.swift
//  Gamy
//
//  Created by Ariel on 08/11/20.
//

import UIKit

protocol GameListRoutingLogic {
    func routeToDetail(segue: UIStoryboardSegue?)
}

protocol GameListDataPassing {
    var dataStore: GameListDataStore? { get }
}

class GameListRouter: NSObject, GameListRoutingLogic, GameListDataPassing {
    
    weak var viewList: GameListVC?
    
    var dataStore: GameListDataStore?
    
    func routeToDetail(segue: UIStoryboardSegue?) {
        let destinationVC = viewList?.storyboard?.instantiateViewController(withIdentifier: "GameDetailVC") as! GameDetailVC
        var destinationDS = destinationVC.router?.dataStore
        
        let index = (viewList?.tableView.indexPathForSelectedRow?.row)!
        destinationDS?.id = viewList?.viewModel.game[index].id
        
        viewList?.show(destinationVC, sender: nil)
    }
}
