//
//  Game.swift
//  Gamy
//
//  Created by Ariel on 04/11/20.
//

class Game: Decodable {
    var id: Int?
    var name: String?
    var description: String?
    var dateRelease: String?
    var imageBackgroundAdditional: String?
    var imageBackground: String?
    var rating: Double?
    var ratingTop: Double?
    var website: String?
    var platform: [Platform]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description = "description_raw"
        case dateRelease = "released"
        case imageBackgroundAdditional = "background_image_additional"
        case imageBackground = "background_image"
        case ratingTop = "rating_top"
        case rating
        case website
        case platform = "parent_platforms"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        dateRelease = try values.decodeIfPresent(String.self, forKey: .dateRelease)
        imageBackgroundAdditional = try values.decodeIfPresent(String.self, forKey: .imageBackgroundAdditional)
        imageBackground = try values.decodeIfPresent(String.self, forKey: .imageBackground)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        platform = try values.decodeIfPresent([Platform].self, forKey: .platform)
    }
}
