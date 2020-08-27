//
//  ViewController.swift
//  CIFilter
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet var cameraView : UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // カメラ撮影開始
    @IBAction func startCamera(_ sender : AnyObject) {
        
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.camera){
            // インスタンス作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    //　撮影完了
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        dismiss(animated: true, completion: {
            self.performSegue(withIdentifier: "showEffectView", sender: nil)
            
        })
    }
        
        var captureImage :UIImage?
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            let nextViewController = segue.destination as! EffectViewController
            
            nextViewController.originalImage = captureImage
        }
        
    }
    


