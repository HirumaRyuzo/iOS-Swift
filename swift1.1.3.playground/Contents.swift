import UIKit

//基本文法：条件分岐、ループ

/*if文、if〜else文、if〜else if文、三項演算子、for文、for in文、switchを
利用したプログラムを作成し、結果をコンソールログを出力する。(Print)*/

//if

let one = 1
if one == 1 {
 print(1)
}

//if else
if one == 2 {
    print(2)
} else {
    print(1)
}

//if else if
if one == 2 {
    print(2)
} else if one == 1 {
    print(1)
}

//三項演算子
one == 1 ? print("同じ値") : print("違う値")

//for swift3.0以降は以下の書き方は廃止
//for var i = 0; i < 10; i++ {
//    print("\(i)")
//}

//for in
for i in 1..<10 { //9までを繰り返す
    print("i: \(i)")
}

for i in 1...10 { //10までを繰り返す
    print("i: \(i)")
}

let arrayData = [1,2,3,4]

for data in arrayData{
    print(data)
}

//swith
let i = 10

switch i {
case 1..<10:   // 1から10未満を意味します。
    print("これは1から9の間です。")
case 10...20:      // 10から20以下を意味します。
    print("これは10から20の間です。")
default:
    print("これは1から20の間ではありません。")
}
