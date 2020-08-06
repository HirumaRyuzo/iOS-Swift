//
//  ViewController.swift
//  swift2.1.6
//
//  Created by 比留間龍三 on 2020/08/03.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import WebKit



class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let request = URLRequest(url: URL(string: "https://google.com/")!)
        webView.load(request)
        webView.navigationDelegate = self
        activityIndicatorView.hidesWhenStopped = true
        self.view.addSubview(webView)
    }

    //インジケーター開始
   private func startIndicator() {
        activityIndicatorView.startAnimating()
    }
    //インジケーター終了
    private func stopIndicator() {
        activityIndicatorView.stopAnimating()
    }
    
    
    @IBAction func back() {
        webView.goBack()
        print ("back")
    }

    @IBAction override func reloadInputViews() {
        self.webView.reload()
                print ("relord")
    }
    
    @IBAction func go() {
        self.webView.goForward()
                print ("go")
    }
    
    //オフライン状態を取得
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let e = error as NSError

        if e.code == -1009 {
            print("Not Connected To Internet")
        }
    }

}

