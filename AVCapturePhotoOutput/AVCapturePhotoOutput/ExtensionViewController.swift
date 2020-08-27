//
//  ExtensionViewController.swift
//  AVCapturePhotoOutput
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import Photos

// デリゲート部分を拡張する
extension ViewController:AVCapturePhotoCaptureDelegate {
    
    // 映像をキャプチャする
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        // Dataを取り出す
        guard let resultPhoto = photo.fileDataRepresentation() else {
            return
        }
        resultView.image = UIImage(data: resultPhoto)
        session.stopRunning()
    }
}
