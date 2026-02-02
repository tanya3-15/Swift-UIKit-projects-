//
//  PlaceData.swift
//  weatherApp
//
//  Created by Deepinderpal Singh on 25/10/24.
//

import Foundation

struct PlaceData:Codable
{
    let longitude:String
    let state:String
    let latitude:String
    let placename:String
}

extension PlaceData{
    enum CodingKeys:String, CodingKey{
        case placename = "place name"
        case longitude
        case state
        case latitude
        
    }
}
