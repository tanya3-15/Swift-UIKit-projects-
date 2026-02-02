//
//  WeatherData.swift
//  weatherApp
//
//  Created by Deepinderpal Singh on 24/10/24.
//

import Foundation

struct WeatherData:Codable
{
    let location:LocationData
    let current:CurrentData
}
