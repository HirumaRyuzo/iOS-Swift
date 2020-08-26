//
//  ViewController.swift
//  mail
//
//  Created by 比留間龍三 on 2020/08/27.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import MessageUI


class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
//    @IBOutlet var button :UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendMail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["xxx@xxx.xxx"]) // 宛先アドレス
            mail.setSubject("アプリからメール送信") // タイトル
            mail.setMessageBody("ここに本文を入力して下さい。", isHTML: false) // 本文
            present(mail, animated: true, completion: nil)
        } else {
            print("送信できません")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("キャンセル")
        case .saved:
            print("下書き保存")
        case .sent:
            print("送信成功")
        default:
            print("送信失敗")
        }
        dismiss(animated: true, completion: nil)
    }
}

