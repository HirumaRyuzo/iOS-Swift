//
//  ViewController.swift
//  stv50_mrmt_23
//
//  Created by 丸本聡 on 2019/07/26.
//  Copyright © 2019 丸本聡. All rights reserved.
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
