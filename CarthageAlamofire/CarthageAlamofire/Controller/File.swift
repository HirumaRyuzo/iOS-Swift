//
//  File.swift
//  stv50_mrmt_32_36
//
//  Created by satoshi.marumoto on 2019/09/25.
//  Copyright © 2019 satoshi.marumoto. All rights reserved.
//

import Foundation

class Account: FavoriteProgrammingLanguageDelegate {
    var favoriteProgrammingLanguage = FavoriteProgrammingLanguage()
    
    func receiveIntern() {
        favoriteProgrammingLanguage.delegate = self
        favoriteProgrammingLanguage.participateIntern()
    }
    
    func swiftStart() {
        print("swiftができる")
    }
}
