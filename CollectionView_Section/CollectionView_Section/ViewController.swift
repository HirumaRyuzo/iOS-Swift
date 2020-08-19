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
    
    // section毎の画像配列
    let imgArray1 = ["0.MickeyIcon","1.MinnieIcon","0.MickeyIcon","1.MinnieIcon"]
    let imgArray2 = ["2.DonaldIcon","2.DonaldIcon","2.DonaldIcon","2.DonaldIcon"]
    let imgArray3 = ["3.GoofyIcon","4.PlutoIcon"]
       
    
        // レイアウト設定
        let sectionInsets = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
        // 1行あたりのアイテム数
        let itemsPerRow: CGFloat = 2
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        // Sectionの数
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 3
        }

        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader else {
                fatalError("Could not find proper header")
            }
            
            if kind == UICollectionView.elementKindSectionHeader {
                header.sectionLabel.text = "section \(indexPath.section)"
                return header
            }
            
            return UICollectionReusableView()
        }

        
        // collection Viewのセルの数を指定
        func collectionView(_ collection: UICollectionView,
                            numberOfItemsInSection section: Int) -> Int {
            if section == 0 {
                return imgArray1.count
            }
            else if section == 1 {
                return imgArray2.count
            }
            else if section == 2 {
                return imgArray3.count
            }
            else {
                return 0
            }
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{

            guard let cell:CollectionViewCell =
                collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                   for: indexPath) as? CollectionViewCell else {
                                                    fatalError("Wrong cell class dequeued")}

            // Section毎に処理
            if indexPath.section == 0 {

                let img = UIImage(named:imgArray1[indexPath.row] )
                cell.iconImageView.image = img
                cell.label.text = imgArray1[indexPath.row]
            }
            else if indexPath.section == 1 {

                let img = UIImage(named:imgArray2[indexPath.row] )
                cell.iconImageView.image = img
                cell.label.text = imgArray2[indexPath.row]
            }
            else if indexPath.section == 2 {

                let img = UIImage(named:imgArray3[indexPath.row] )
                cell.iconImageView.image = img
                cell.label.text = imgArray3[indexPath.row]
            }

            return cell
        }
        
        // Screenサイズに応じたセルサイズを返す
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = collectionView.frame.width - paddingSpace
            let widthPerItem = availableWidth / 2
            return CGSize(width: widthPerItem, height: collectionView.frame.width / 1.5)
        }
    }


