//
//  ViewController.swift
//  stv50_mrmt_37
//
//  Created by satoshi.marumoto on 2019/09/12.
//  Copyright © 2019 satoshi.marumoto. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func shareButton(sender: UIButton) {
        
        let photo: SharePhoto = SharePhoto()
        photo.image = UIImage(named: "park")

        let dialog = ShareDialog()
        let content = SharePhotoContent()
        content.photos = [photo]

        dialog.shareContent = content
        dialog.mode = ShareDialog.Mode.native
        
        if dialog.canShow {
           dialog.show()
        } else {
          showNotFoundFacebookAccountAlert()
        }
    }

    private func showNotFoundFacebookAccountAlert() {
        let title = "FAILED"
        let message = "ERROR"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        present(alert, animated: true, completion: nil)
    }

}

//ログインボタン
// Swift // // ファイルのヘッダーにこれを追加します。例: ViewController.swift import FBSDKLoginKit // 本文クラスViewControllerにこれを追加します:UIViewController { override func viewDidLoad() { super.viewDidLoad() let loginButton = FBLoginButton() loginButton.center = view.center view.addSubview(loginButton) } }

//ログインステータス
// Swift override func viewDidLoad() { super.viewDidLoad() if let token = AccessToken.current, !token.isExpired { // User is logged in, do work such as go to next view controller. } }
    
//ログインボタンアクセス許可
// Swift // // 6aのコードサンプルを拡張します。Facebookログインをコードに追加します // viewDidLoadメソッドに次を追加します: loginButton.permissions = ["public_profile", "email"]
