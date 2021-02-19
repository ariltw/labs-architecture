//
//  Pagination.swift
//  Gamy
//
//  Created by Ariel on 04/11/20.
//

class Pagination: Decodable {
    var count: Int?
    var next: String?
    var previous: String?
    
    private enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        previous = try values.decodeIfPresent(String.self, forKey: .previous)
    }
}
