//
//  ViewController.swift
//  UIPickerView
//
//  Created by 比留間龍三 on 2020/08/11.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tapLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let dataList = [
        "Mickey Mouse","Minnie Mouse","Donald Duck","Goofy","Pluto"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
         // Delegate設定
               pickerView.delegate = self
               pickerView.dataSource = self
        // label初期表示
               label.text = "Disney\nBig5"
        //　labelの高さを可変にする
               label.sizeToFit()
        // pickerを初期表示は隠す
        pickerView.isHidden = true;
        
    }

    override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?){
        print("touched")
        //myLabelはタッチ判定をしたいUILabel
        if touchedLabel(touches: touches,view:label){
          print("PikcerView表示")
        pickerView.isHidden = false;
          return
        }
    }
    
    //タッチしたビューと指定したビューが一致した時、trueが返る
    func touchedLabel(touches: Set<UITouch>, view:UILabel)->Bool{
        //全指のタッチについて処理
        for touch: AnyObject in touches {
            let t: UITouch = touch as! UITouch
            if t.view?.tag == view.tag {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // dataListの数
        return dataList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return dataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        label.text = dataList[row]
    }

}



