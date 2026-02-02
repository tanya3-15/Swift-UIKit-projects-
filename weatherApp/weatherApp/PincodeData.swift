//
//  PincodeData.swift
//  weatherApp
//
//  Created by Deepinderpal Singh on 25/10/24.
//

import Foundation


struct PincodeData:Codable{
    let postcode:String
    let country:String
    let places:[PlaceData]
}

extension  PincodeData{
    enum CodingKeys:String,CodingKey{
        case postcode = "post code"
        case country
        case places
    }
}
