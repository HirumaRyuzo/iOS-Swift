//
//  ViewController.swift
//  TwitterSample
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tweetButton(_ sender: Any) {
        sndTweet()
    }
    
    func sndTweet() {
        if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
            sndTweetExec()
        } else {
            TWTRTwitter.sharedInstance().logIn(with: self, completion: { (session, error) in
                if let sess = session {
                    print("Signed in as \(sess.userName)")
                    self.sndTweetExec()
                } else {
                    print("login error")
                }
            })
        }
    }
    
    func sndTweetExec() {
        let str:String = "サンプルツイート"
        guard let img = UIImage(named: "park") else { return }
        let comp = TWTRComposerViewController.init(initialText: str, image: img, videoData: nil)
        comp.delegate = self
        present(comp, animated: true, completion: nil)
    }
    
    func tweetAlert(memo:String) {
        let alert:UIAlertController = UIAlertController(title: "TwitterKitサンプル", message: memo, preferredStyle: UIAlertController.Style.alert)
        let defAct:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(defAct)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: TWTRComposerViewControllerDelegate {
    func composerDidCancel(_ controller: TWTRComposerViewController) {
        print("Cancel")
    }
    
    func composerDidFail(_ controller: TWTRComposerViewController, withError error: Error) {
        print("Error")
        let store = TWTRTwitter.sharedInstance().sessionStore
        if let userID = store.session()?.userID {
            store.logOutUserID(userID)
        }
        dismiss(animated: false, completion: nil)
        DispatchQueue.main.async {
            self.tweetAlert(memo:"Twitterに投稿に失敗しました")
        }
    }
    
    func composerDidSucceed(_ controller: TWTRComposerViewController, with tweet: TWTRTweet) {
        print("OK")
        dismiss(animated: false, completion: nil)
        DispatchQueue.main.async {
            self.tweetAlert(memo: "Twitterに投稿しました。")
        }
    }
    
}

