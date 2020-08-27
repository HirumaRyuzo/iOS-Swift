//
//  EffectViewController.swift
//  CIFilter
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {
    
    @IBOutlet var effectImage: UIImageView!

    var originalImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
       effectImage.image = originalImage
    }
    
    @IBAction func effectButtonAction(_sender: AnyObject) {
        
        let filterName = "CIPhotoEffectMono"
        
        let rotate = originalImage!.imageOrientation
        
        let inputImage = CIImage(image: originalImage!)
        
        let effectFilter = CIFilter(name: filterName)!
        
        effectFilter.setDefaults()
        
        effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
        
        let outputImage = effectFilter.outputImage
        
        let ciContext = CIContext(options: nil)
        
        let cgImage = ciContext.createCGImage(outputImage!, from: outputImage!.extent)
        
        effectImage.image = UIImage(cgImage: cgImage!, scale: 1.0, orientation: rotate)
    }
    
    @IBAction func closeButtonAction(_sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}
