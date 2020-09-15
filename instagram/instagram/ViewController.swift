//
//  ViewController.swift
//  instagram
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
var controller: UIDocumentInteractionController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func share(_ sender: Any) {
        do {

           let Username =  "ryusan.e.disney" // Your Instagram Username here
//            let appURL = URL(string: "instagram://user?username=\(Username)")!
            let appURL = URL(string: "instagram://camera")!

            let application = UIApplication.shared

            if application.canOpenURL(appURL) {
                application.open(appURL)
            } else {
                // if Instagram app is not installed, open URL inside Safari
//                let webURL = URL(string: "https://instagram.com/\(Username)")!
                                let webURL = URL(string: "instagram://camera")!

                application.open(webURL)
            }
    
}
}}
