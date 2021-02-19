//
//  GameListInteractor.swift
//  Gamy
//
//  Created by Ariel on 04/11/20.
//

protocol GameListBussinessLogic {
    func requestList(page: Int)
    func requestSearch(keyword: String)
}

protocol GameListDataStore {
    var id: Int? { get set }
}

class GameListInteractor: GameListBussinessLogic, GameListDataStore {
    
    var id: Int?
    
    var presenter: GameListPresentationLogic?
    var worker = GameListWoker()
    
    func requestList(page: Int) {
        worker.fetchList(from: String(page)) { (result) in
            switch result {
            case .success(let response):
                self.presenter?.presentList(result: .success(response))
            case .failure(let error):
                self.presenter?.presentList(result: .failure(error))
            }
        }
    }
    
    func requestSearch(keyword: String) {
        worker.fetchSearch(with: keyword) { (result) in
            switch result {
            case .success(let response):
                self.presenter?.presentList(result: .success(response))
            case .failure(let error):
                self.presenter?.presentList(result: .failure(error))
            }
        }
    }
}
