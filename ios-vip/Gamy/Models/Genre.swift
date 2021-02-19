//
//  Genre.swift
//  Gamy
//
//  Created by Ariel on 04/11/20.
//

class Genre: Decodable {
    var id: Int?
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
