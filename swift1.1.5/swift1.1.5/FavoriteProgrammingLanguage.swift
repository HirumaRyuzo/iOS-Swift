//
//  FavoriteProgrammingLanguage.swift
//  swift1.1.5
//
//  Created by 比留間龍三 on 2020/08/18.
//  Copyright © 2020 すいふと. All rights reserved.
//

import Foundation

class FavoriteProgrammingLanguage {
    weak var delegate: FavoriteProgrammingLanguageDelegate?
    
    func participateIntern() {
        delegate?.canSwift()
    }
}
