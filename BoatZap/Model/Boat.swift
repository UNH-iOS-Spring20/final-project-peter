//
//  Boats.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/15/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.

import FirebaseFirestore

class Boat : FirebaseCodable {
    
    var id: String
    @Published var name: String
    @Published var type: String
    @Published var make: String
    @Published var length: String
    @Published var price: String
    @Published var address: String
    @Published var latitude: String
    @Published var longitude: String
    @Published var photo: String
    
    var data: [String: Any] {
        return [
            "name": name,
            "type": type,
            "make": make,
            "length": length,
            "price": price,
            "address": address,
            "latitude": latitude,
            "longitude": longitude,
            "photo": photo
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let name = data["name"] as? String,
            let type = data["type"] as? String,
            let make = data["make"] as? String,
            let length = data["length"] as? String,
            let price = data["price"] as? String,
            let address = data["address"] as? String,
            let latitude = data["latitude"] as? String,
            let longitude = data["longitude"] as? String,
            let photo = data["photo"] as? String
            
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.type = type
        self.make = make
        self.length = length
        self.price = price
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.photo = photo
    }
    
    
    #if DEBUG
    static let example = Boat(id: "1", data: ["name": "Test Boat Name",
                                              "type": "Sailboat",
                                              "make": "Race Boat",
                                              "length": "44.5",
                                              "price": "99,999.98",
                                              "address": "56 State Street",
                                              "latitude": "42.456",
                                              "longitude": "46.654",
                                              "photo" : "2"
                                            ])!
    #endif
}
