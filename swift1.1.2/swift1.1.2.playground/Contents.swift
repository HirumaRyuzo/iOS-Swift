import UIKit

/*Array型、Dictionary型の変数を定義し、
 コンソールにログを出力する。(Print)*/

//Array
let number: [Int] = [11,22,33,44]
print (number)
print (number[0])

//Dictonary
var personInfo:[String:Any] = ["name": "hachinobu", "age": 28]

// データ追加
personInfo["sex"] = "man"

// データ取得
personInfo["name"] //  hachinobu
personInfo["age"]    //  28
personInfo["sex"]    //  man

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports)
