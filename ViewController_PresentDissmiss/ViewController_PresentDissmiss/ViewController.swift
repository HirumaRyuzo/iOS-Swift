//
//  SceneDelegate.swift
//  ViewController_PresentDissmiss
//
//  Created by 比留間龍三 on 2020/08/23.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button :UIButton!
    
    @IBAction func goNext(_ sender:UIButton) {
        let storyboard = UIStoryboard(name: "NextView", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "NextViewController")
        present(next, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
