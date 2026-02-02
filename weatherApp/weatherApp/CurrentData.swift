//
//  CurrentData.swift
//  weatherApp
//
//  Created by Deepinderpal Singh on 24/10/24.
//

import Foundation

struct CurrentData: Codable
{
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int
}
