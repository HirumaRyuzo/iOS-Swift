//
//  ViewController.swift
//  swift2.1.3
//
//  Created by 比留間龍三 on 2020/07/31.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageview: UIImageView!
    
    let image1 = UIImage(named:"IMG_1")!
    let image2 = UIImage(named:"IMG_2")!
    let image3 = UIImage(named:"IMG_3")!
    let image4 = UIImage(named:"IMG_4")!
    
    // UIImage の配列を作る
    var imageListArray :Array<UIImage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonAction(_ sender: Any) {
              // UIImage 各要素を追加、ちょっと冗長的ですが...
               imageListArray = [image1,image2,image3,image4]
               let ret = Int(arc4random_uniform(3))
               imageview.image = imageListArray[ret]
        print(imageview!)
    }
}
