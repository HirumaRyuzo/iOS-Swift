//
//  ViewController.swift
//  AVCapturePhotoOutput
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // シャッターボタン
    @IBOutlet var shutterButton: UIButton!
    // プレビュー用のビュー
    @IBOutlet var previewView: UIImageView!
    //撮影後のビュー
    @IBOutlet var resultView: UIImageView!
    
    // インスタンスの作成
    var session = AVCaptureSession()
    var photoOutputObj = AVCapturePhotoOutput()
    
    // プライバシーと入出力のステータス
    var authStatus:AuthorizedStatus = .authorized
    var inOutStatus:InputOutputStatus = .ready
    
    // 認証のステータス
    enum AuthorizedStatus {
        case authorized
        case notAuthorized
        case failed
    }
    // 入出力のステータス
    enum InputOutputStatus {
        case ready
        case notReady
        case failed
    }
    
    // アラート表示する必要からviewDidAppearで実行する
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // セッション実行中ならば中断する
        guard !session.isRunning else {
            return
        }
        
        setupInputOutput()
        // カメラの準備ができているかどうか
        if authStatus == .authorized && inOutStatus == .ready {
            // プレビューレイヤの設定
            setPreviewLayer()
            // セッション開始
            session.startRunning()
            
            shutterButton.isEnabled = true
        } else {
            // アラートを出す
            showAlert(appName: "カメラ")
        }
    }
    
    // シャッターボタンで実行する
    @IBAction func takePhoto(_ sender: Any) {
        // キャプチャのセッティング
        let captureSetting = AVCapturePhotoSettings()
        captureSetting.flashMode = .auto
        captureSetting.isAutoStillImageStabilizationEnabled = true
        captureSetting.isHighResolutionPhotoEnabled = false
        // キャプチャのイメージ処理はデリゲートに任せる
        photoOutputObj.capturePhoto(with: captureSetting, delegate: self)
    }
    
    // 入出力の設定
    func setupInputOutput(){
        //解像度の指定
        session.sessionPreset = AVCaptureSession.Preset.photo
        
        // 入力の設定
        do {
            //デバイスの取得
            guard let device = AVCaptureDevice.default(
                AVCaptureDevice.DeviceType.builtInWideAngleCamera,
                for: AVMediaType.video, // ビデオ入力
                position: AVCaptureDevice.Position.back) else { return }// バックカメラ
            // 入力元
            let input = try AVCaptureDeviceInput(device: device)
            if session.canAddInput(input){
                session.addInput(input)
            } else {
                print("セッションに入力を追加できなかった")
                return
            }
        } catch  let error as NSError {
            print("カメラが使えない \n \(error.description)")
            // カメラのプライバシー設定を開くためのアラートを表示する
            showAlert(appName: "カメラ")
            return
        }
        
        // 出力の設定
        if session.canAddOutput(photoOutputObj) {
            session.addOutput(photoOutputObj)
        } else {
            print("セッションに出力を追加できなかった")
            return
        }
    }
    
    // プライバシー認証のアラートを表示する
    func showAlert(appName:String){
        let aTitle = appName + "のプライバシー認証"
        let aMessage = "設定＞プライバシー＞" + appName + "で利用を許可してください。"
        let alert = UIAlertController(title: aTitle, message: aMessage, preferredStyle: .alert)
        guard let url = URL(string: UIApplication.openSettingsURLString) else {return}
        
        // OKボタン（シャッターボタンを利用できなくする）
        alert.addAction(
            UIAlertAction(title: "OK",style: .default,
                          handler: { action in
                            self.shutterButton.isEnabled = false
            })
        )
        // 設定を開くボタン
        alert.addAction(
            UIAlertAction(
                title: "設定を開く",style: .default,
                handler:  { action in
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
            })
        )
        // アラートを表示する
        present(alert, animated: false, completion:nil)
    }
    
    // プレビューレイヤの設定
    func setPreviewLayer(){
        // プレビューレイヤを作る
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.bounds
        previewLayer.masksToBounds = true
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        // previewViewに追加する
        previewView.layer.addSublayer(previewLayer)
    }
    
}
