//
//  GameListPresenter.swift
//  Gamy
//
//  Created by Ariel on 04/11/20.
//

protocol GameListPresentationLogic {
    func presentList(result: Result<GameList.Response, Error>)
}

class GameListPresenter: GameListPresentationLogic {
    
    weak var viewList: GameListDisplayLogic?
    
    func presentList(result: Result<GameList.Response, Error>) {
        switch result {
        case .success(let response):
            let data = GameList.ViewModel(game: response.games ?? [Game](), nextPage: response.next)
            viewList?.listResult(result: .success(data))
        case .failure(let error):
            viewList?.listResult(result: .failure(error))
        }
    }
}
