//
//  ViewController.swift
//  CarthageAlamofire
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import RealmSwift

protocol ViewDelegate: class {
    func updateAPI(weatherLists : [DbTable])
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewDelegate {

    var weatherApiModel = WeatherApiModel()
    var weatherListsResult: [DbTable]?
    @IBOutlet weak var table:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        receiveEvent()

    }
    
    func receiveEvent() {
        weatherApiModel.delegate = self
        weatherApiModel.weatherApi()
    }

    func updateAPI(weatherLists : [DbTable]) {
        weatherListsResult = weatherLists
        self.table.reloadData()
    }

    //Table Viewセル数指定
    func tableView(_ table: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        guard let weatherListCount = weatherListsResult?.count else { return 0 }
        return weatherListCount
    }
    
    //各セル要素設定
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? TableViewCell else {fatalError("cell error")}
        guard let date = weatherListsResult?[indexPath.row].date,
              let telop = weatherListsResult?[indexPath.row].telop else {fatalError("error")}
        
        cell.dateLabel.text = date
        cell.telopLabel.text = telop
        
        guard let iconUrl = weatherListsResult?[indexPath.row].iconUrl else {fatalError("error")}
        guard let url = URL(string: iconUrl) else {fatalError("error")}
        if let iconData = try?Data(contentsOf: url) {
            cell.iconImageView?.image = UIImage(data: iconData)
        }
        
        return cell
    }
    

}
