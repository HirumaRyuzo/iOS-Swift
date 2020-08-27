//
//  ViewController.swift
//  CameraRoll
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import AssetsLibrary
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var facePicture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setButton(_ sender: UIButton) {
        toCameraRoll()
    }
    
    @IBAction func toCameraRoll(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let picker = UIImagePickerController()
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    //写真が選択された時の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //選択された画像を保存
        if let picker = info[.originalImage] as? UIImage {
            
            //画像を設定
            facePicture.image = picker
        }
        
        //写真ライブラリを閉じる
        dismiss(animated: true, completion: nil)
    }


}

