//
//  WeatherApiModel.swift
//  CarthageAlamofire
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class WeatherApiModel : Object {
    
    //Realmから受け取るデータ
    var weatherLists: [DbTable]?

    weak var delegate: ViewDelegate?
    
    func weatherApi(){
        //お天気APIから東京の天気を取得する
        let url:String = "http://weather.livedoor.com/forecast/webservice/json/v1?city=130010"
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            //成功時
            case .success:
                guard let data = response.data else {return}
                guard let weatherNews = try? JSONDecoder().decode(WeatherNews.self, from: data) else {return}
                print("success")
                
                let forecasts = weatherNews.forecasts
                
                guard let realm = try? Realm() else {return}
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                
                let weather = [DbTable(value: ["date": forecasts[0].date,"telop":              forecasts[0].telop,"iconUrl": forecasts[0].image.url]),
                               DbTable(value: ["date": forecasts[1].date,"telop": forecasts[1].telop,"iconUrl": forecasts[1].image.url]),
                               DbTable(value: ["date": forecasts[2].date,"telop": forecasts[2].telop,"iconUrl": forecasts[2].image.url])]
                
                try? realm.write {
                    realm.add(weather, update: .modified)
                }
                
                self.weatherLists = Array(realm.objects(DbTable.self))
                
                guard let weatherResult = self.weatherLists else {return}
                self.delegate?.updateAPI(weatherLists: weatherResult)
            
        //成功時
            case .failure(let error):
                print(error)
            }
        }
    }
}
