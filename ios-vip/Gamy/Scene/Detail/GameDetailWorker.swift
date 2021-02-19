//
//  GameDetailWorker.swift
//  Gamy
//
//  Created by Ariel on 05/11/20.
//

import Foundation

protocol GameDetailType {
    func fetchDetail(id: Int, completion: @escaping (Result<GameDetail.Response, Error>) -> Void)
}

class GameDetailWorker: GameDetailType {
    
    private var restClient = RestClient()
    
    func fetchDetail(id: Int, completion: @escaping (Result<GameDetail.Response, Error>) -> Void) {
        restClient.GET(from: GameDetail.API + "/" + String(id), with: nil) { (result) in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(GameDetail.Response.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(BaseError.INTERNAL_ERROR))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
