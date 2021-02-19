//
//  GameDetailInteractor.swift
//  Gamy
//
//  Created by Ariel on 05/11/20.
//

protocol GameDetailBussinessLogic {
    func requestDetail()
}

protocol GameDetailDataStore {
    var id: Int! { get set }
    var game: Game! { get set }
}

class GameDetailInteractor: GameDetailBussinessLogic, GameDetailDataStore {
    
    var presenter: GameDetailPresentationLogic?
    var worker = GameDetailWorker()
    
    var id: Int!
    var game: Game!
    
    func requestDetail() {
        worker.fetchDetail(id: id) { (result) in
            switch result {
            case .success(let response):
                self.presenter?.presentDetail(result: .success(response))
            case .failure(let error):
                self.presenter?.presentDetail(result: .failure(error))
            }
        }
    }
}
