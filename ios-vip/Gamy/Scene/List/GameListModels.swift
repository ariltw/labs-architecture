//
//  GameListModels.swift
//  Gamy
//
//  Created by Ariel on 04/11/20.
//

enum GameList {
    
    static let API = "/api/games?"
    
    struct Request: Encodable {
        // no body
    }
    
    class Response: Pagination {
        var games: [Game]?
        
        private enum CodingKeys: String, CodingKey {
            case games = "results"
        }
        
        required init(from decoder: Decoder) throws {
            try super.init(from: decoder)
            let values = try decoder.container(keyedBy: CodingKeys.self)
            games = try values.decodeIfPresent([Game].self, forKey: .games)
        }
    }
    
    struct ViewModel {
        var game: [Game]!
        var nextPage: String?
    }
}
