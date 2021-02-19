//
//  GameListWorker.swift
//  Gamy
//
//  Created by Ariel on 04/11/20.
//

import Foundation

protocol GameListType {
    func fetchList(from nextPage: String, completion: @escaping (Result<GameList.Response, Error>) -> Void)
    func fetchSearch(with keyword: String, completion: @escaping (Result<GameList.Response, Error>) -> Void)
}

class GameListWoker: GameListType {
    
    private var restClient = RestClient()
    
    func fetchList(from nextPage: String, completion: @escaping (Result<GameList.Response, Error>) -> Void) {
        let query = [URLQueryItem(name: "page", value: nextPage)]
        restClient.GET(from: GameList.API + nextPage, with: query) { (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(GameList.Response.self, from: data)
                    return completion(.success(response))
                } catch {
                    return completion(.failure(BaseError.INTERNAL_ERROR))
                }
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
    func fetchSearch(with keyword: String, completion: @escaping (Result<GameList.Response, Error>) -> Void) {
        let query = [URLQueryItem(name: "search", value: keyword)]
        restClient.GET(from: GameList.API, with: query) { (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(GameList.Response.self, from: data)
                    return completion(.success(response))
                } catch {
                    return completion(.failure(BaseError.INTERNAL_ERROR))
                }
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
