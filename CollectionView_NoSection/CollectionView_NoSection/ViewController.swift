//
//  SceneDelegate.swift
//  CollectionView_NoSection
//
//  Created by 比留間龍三 on 2020/08/16.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    // 画像
    let photos = ["0.MickeyIcon", "0.MickeyIcon","0.MickeyIcon","1.MinnieIcon","1.MinnieIcon",
                  "1.MinnieIcon","2.DonaldIcon","3.GoofyIcon","img8"]
    
    // レイアウト設定
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 2.0, bottom: 2.0, right: 2.0)
    // 1行あたりのアイテム数
    let itemsPerRow: CGFloat = 3

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{

        guard let cell:CollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                               for: indexPath) as? CollectionViewCell else {
                                                fatalError("Wrong cell class dequeued")}

        let image = UIImage(named: photos[indexPath.row])

        cell.iconImageView.image = image
        cell.label.text = photos[indexPath.row]
        
        return cell
    }

    
    // Screenサイズに応じたセルサイズを返す
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / 3
        return CGSize(width: widthPerItem, height: collectionView.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
}
