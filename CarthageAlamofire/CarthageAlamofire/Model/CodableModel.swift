//
//  CodableModel.swift
//  CarthageAlamofire
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import Foundation

struct WeatherNews: Codable {
    let title: String
    let publicTime: String
    let forecasts: [Forecast]
    let location: WeatherLocation
    let description: WeatherDescription
}

struct Forecast: Codable {
    let dateLabel: String
    let telop: String
    let date: String
    let temperature: TemperatureCollection
    let image: WeatherImage
}

struct TemperatureCollection: Codable {
    let min: Temperature?
    let max: Temperature?
}

struct Temperature: Codable{
    let celsius: String
    let fahrenheit: String
}

struct WeatherImage: Codable {
    let width: Int
    let height: Int
    let title: String
    let url: String
}

struct WeatherLocation: Codable {
    let city: String
    let area: String
    let prefecture: String
}

struct WeatherDescription: Codable {
    let text: String
    let publicTime: String
}
