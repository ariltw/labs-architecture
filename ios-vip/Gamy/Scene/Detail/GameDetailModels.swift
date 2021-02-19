//
//  GameDetailModels.swift
//  Gamy
//
//  Created by Ariel on 05/11/20.
//

enum GameDetail {
    
    static let API = "/api/games"
    
    struct Request: Encodable {
        // unused
    }
    
    class Response: Game {
        // use the parent class
    }
    
    struct ViewModel {
        let title: String
    }
    
}
