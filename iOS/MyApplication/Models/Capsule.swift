//
//  Capsule.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import Foundation
import FirebaseDatabase

struct Capsule: Codable {
    var name: String
    var description: String
    var imageUrl: String
    var heroImageUrl: String?
    var flavorProfile: String
    var origin: String
    var intensity: Int
    var price: Double
    var categories: [String]
    var id: String?

    init(name: String = "",
         description: String = "",
         imageUrl: String = "",
         heroImageUrl: String? = nil,
         flavorProfile: String = "",
         origin: String = "",
         intensity: Int = 0,
         price: Double = 0.0,
         categories: [String] = [],
         id: String? = nil) {
        
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.heroImageUrl = heroImageUrl
        self.flavorProfile = flavorProfile
        self.origin = origin
        self.intensity = intensity
        self.price = price
        self.categories = categories
        self.id = id
    }
}

extension Capsule {
    init(_ snapshot: DataSnapshot) {
        if let value = snapshot.value as? [String: Any],
            let name = value["name"] as? String,
            let description = value["description"] as? String,
            let imageUrl = value["imageUrl"] as? String,
            let flavorProfile = value["flavorProfile"] as? String,
            let origin = value["origin"] as? String,
            let intensity = value["intensity"] as? Int,
            let price = value["price"] as? Double,
            let categories = value["categories"] as? [String]  {
           
            let heroImageUrl = value["heroImageUrl"] as? String
            let id = snapshot.key
            
            self.init(name: name,
                           description: description,
                           imageUrl: imageUrl,
                           heroImageUrl: heroImageUrl,
                           flavorProfile: flavorProfile,
                           origin: origin,
                           intensity: intensity,
                           price: price,
                           categories: categories,
                           id: id)
            
        } else {
            self.init()
        }
    }
}
