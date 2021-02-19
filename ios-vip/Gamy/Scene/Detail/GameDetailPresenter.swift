//
//  GameDetailPresenter.swift
//  Gamy
//
//  Created by Ariel on 05/11/20.
//

protocol GameDetailPresentationLogic {
    func presentDetail(result: Result<GameDetail.Response, Error>)
}

class GameDetailPresenter: GameDetailPresentationLogic {
    
    weak var viewDetail: GameDetailDisplayLogic?
    
    func presentDetail(result: Result<GameDetail.Response, Error>) {
        switch result {
        case .success(let response):
            let data = GameDetail.ViewModel(title: response.name ?? "-")
            self.viewDetail?.detailResult(result: .success(data))
        case .failure(let error):
            self.viewDetail?.detailResult(result: .failure(error))
        }
    }
}
