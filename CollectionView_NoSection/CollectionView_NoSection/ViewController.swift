//
//  ViewController.swift
//  CollectionView_NoSection
//
//  Created by 比留間龍三 on 2020/08/16.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let photos = ["0.MickeyIcon", "1.MinnieIcon", "2.DonaldIcon", "3.GoofyIcon", "4.PlutoIcon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    //セル（要素）に表示する内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // "Cell" の部分は　Storyboard でつけた cell の identifier。
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        // Tag番号を使ってインスタンスをつくる
        let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
        let photoImage = UIImage(named: photos[indexPath.row])
        photoImageView.image = photoImage
        
        return cell
    }
    
    // レイアウト設定　UIEdgeInsets については下記の参考図を参照。
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 2.0, bottom: 2.0, right: 2.0)
    // 1行あたりのアイテム数
    private let itemsPerRow: CGFloat = 2
    
    // Screenサイズに応じたセルサイズを返す
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemsPerRow
//        return CGSize(width: widthPerItem, height: widthPerItem + 42)
//        
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = view.frame.width / 3 - 2
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    // セルの行間の設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
}
