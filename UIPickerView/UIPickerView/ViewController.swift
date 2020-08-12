//
//  ViewController.swift
//  UIPickerView
//
//  Created by 比留間龍三 on 2020/08/11.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    private let pickerView = UIPickerView(frame: .zero)

    private let dataList = ["Mickey Mouse", "Minnie Mouse", "Donald Duck", "Goofy", "Pluto"]

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = "Disney\nBig5"
        setup()
    }

    private func setup() {
        pickerView.delegate = self
        pickerView.dataSource = self
        let toolbar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(ViewController.tappedDone))
        toolbar.items = [space, doneButton]
        toolbar.sizeToFit()
        textField.inputView = pickerView
        textField.inputAccessoryView = toolbar
    }

    @objc func tappedDone() {
        textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    textField.resignFirstResponder()
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = dataList[row]
    }
}



