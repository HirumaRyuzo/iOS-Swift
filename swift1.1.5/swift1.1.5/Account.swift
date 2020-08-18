//
//  Account.swift
//  swift1.1.5
//
//  Created by 比留間龍三 on 2020/08/18.
//  Copyright © 2020 すいふと. All rights reserved.
//

import Foundation

class Account: FavoriteProgrammingLanguageDelegate {
    var favoriteProgrammingLanguage = FavoriteProgrammingLanguage()
    
    func intern() {
        favoriteProgrammingLanguage.delegate = self
        favoriteProgrammingLanguage.participateIntern()
    }
    
    func canSwift() {
        print("Swiftができる")
    }
}
