//
//  CustomCell.swift
//  CollectionView_NoSection
//
//  Created by 比留間龍三 on 2020/08/16.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet var imgSample:UIImageView!
//    @IBOutlet var lblSample:UILabel!

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
}
