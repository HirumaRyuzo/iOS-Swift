//
//  CustomTextField.swift
//  UIPickerView
//
//  Created by 比留間龍三 on 2020/08/12.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

final class CustomTextField: UITextField {

    /* 入力キャレット非表示 */
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    /* 範囲選択カーソル非表示 */
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }
    /* コピー・ペースト・選択等のメニュー非表示 */
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}





























