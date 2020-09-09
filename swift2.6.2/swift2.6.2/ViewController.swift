//
//  ViewController.swift
//  swift2.6.2
//
//  Created by 比留間龍三 on 2020/09/04.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var delegate : SceneDelegate?
    
    @IBAction func schemeCopy(_ sender: Any) {
        UIPasteboard.general.string = "stv://hostname:8080/test?name=taro"
    }
    
    @IBAction func safariJump(_ sender: Any) {
         UIApplication.shared.open(URL(string:"https://www.google.co.jp/")!)
    }
    
    @IBOutlet weak var host: UILabel!
    @IBOutlet weak var port: UILabel!
    @IBOutlet weak var query: UILabel!
    
    
    @IBAction func getParameter(_ sender: Any) {
        print("test")
        func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>){
            // コールバックで来たURLの取得
            guard let url = URLContexts.first?.url else {
                return
            }
            let components = URLComponents(string: url.absoluteString)
            let host = components?.host
            print(host!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.host.text = "..."
        self.port.text = "..."
        self.query.text = "..."
        
    }
}

