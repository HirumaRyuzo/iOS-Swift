//
//  ViewController.swift
//  swift1.1.5
//
//  Created by 比留間龍三 on 2020/08/18.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

protocol FavoriteProgrammingLanguageDelegate: class {
    func canSwift()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let account = Account()
        account.intern()
    }

}
