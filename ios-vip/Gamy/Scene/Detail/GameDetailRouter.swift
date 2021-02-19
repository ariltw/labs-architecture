//
//  GameDetailRouter.swift
//  Gamy
//
//  Created by Ariel on 12/11/20.
//

import UIKit

protocol GameDetailRoutingLogic {
    
}

protocol GameDetailDataPassing {
    var dataStore: GameDetailDataStore? { get }
}

class

GameDetailRouter: NSObject, GameDetailRoutingLogic, GameDetailDataPassing {
    
    var dataStore: GameDetailDataStore?
    
    weak var viewController: GameDetailVC?
    
}
