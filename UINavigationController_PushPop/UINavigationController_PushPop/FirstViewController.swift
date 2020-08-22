//
//  SceneDelegate.swift
//  UINavigationController_PushPop
//
//  Created by 比留間龍三 on 2020/08/23.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Second", bundle: nil)
        guard let nextView = storyboard.instantiateViewController(withIdentifier: "Second") as? SecondViewController else { return }
        navigationController?.pushViewController(nextView, animated: true)
    }
}
