//
//  main.swift
//  WordBingoGame
//
//  Created by 近藤元気 on 2020/09/15.
//  Copyright © 2020 genkikondo. All rights reserved.
//

import Foundation


var check = Check()
//２次元配列の縦の配列宣言
var verticalArray:[[Int]]
    = [[0],[0]]
//２次元配列の縦の配列宣言
var horizontalArray:[[Int]] = [[0],[0]]
//２次元配列の斜めの配列宣言
var slantArray:[[Int]] = [[0],[0]]


//標準入力された文字列を一時的に入れておく配列
var cardArray:[String] = []


//標準入力された文字列を整数に変換して変数に入れる
let s = Int(readLine()!)!


//ビンゴカードの１列の枚数
var numberSheets = s

//----まずビンゴボードを作る----
//標準入力をsplitで切り出して二次元配列に入れる

var stringBordWArray :[[String]] = [[String(numberSheets)],[String(numberSheets)]]
var boardWArray :[[Int]] = [[numberSheets],[numberSheets]]
//標準入力受付
//標準入力で受付けた変数を全て多次元配列に入れる
for i in 0..<s{
    //標準入力された文字列を" "区切りで分割して変数に入れる
    let cardString = readLine()!
    let sp = cardString.split(separator : " ")
    
    for i in 0..<sp.count{
        
        cardArray[0] = String(sp[i])
        stringBordWArray[i].append(cardArray[0])
        //一度配列の中身をからにする
        cardArray.removeAll()
    }
    
}
for i in 0..<stringBordWArray.count{
    for j in 0..<stringBordWArray.count{
        boardWArray[i][j] = Int(stringBordWArray[i][j])!
    }
}
//----ビンゴボード----

//----選ばれた単語カードを作る----
//標準入力された文字列を一時的に入れておく配列
var selectStringArray:[String] = []
//標準入力された文字列を整数に変換して変数に入れる
let n = Int(readLine()!)!
//標準入力受付
//標準入力で受付けた変数を全て配列に入れる
for i2 in 0..<n{
    let ss = readLine()!
    selectStringArray.append(ss)
}
var selectedIntArray:[Int] = [selectStringArray.count]
for i in 0..<selectStringArray.count{
    selectedIntArray[i] = Int(selectStringArray[i])!
}
//----選ばれた単語カード----

//縦の判定、横の判定、斜めの判定用に別の配列に取り出す
//一列用
var row:[[Int]] = [[numberSheets],[numberSheets]]
//一行用
var col:[[Int]] = [[numberSheets],[numberSheets]]
//斜め用
var slant:[[Int]] = [[2],[numberSheets]]

for i in 0..<boardWArray.count{
    for j in 0..<boardWArray.count{
        col[i][j] = boardWArray[i][j]
        row[i][j] = boardWArray[i][j]
        if i == j{
            slant[0][i] = boardWArray[i][j]
            
        }else if i + j == numberSheets - 1{
            slant[1][i] = boardWArray[i][j]
        }
    }
}


//全パターンチェックして回る
var bingoNum = 0

for i in col{
    let checkString = check.check(board: i, selected: selectedIntArray)
    if checkString == "yes"{
        bingoNum+=1
    }
}
for i in row{
    let checkString = check.check(board: i, selected: selectedIntArray)
    if checkString == "yes"{
        bingoNum+=1
    }
}
for i in slant{
    let checkString = check.check(board: i, selected: selectedIntArray)
    if checkString == "yes"{
        bingoNum+=1
    }
}
if bingoNum >= 1{
    print("yes")
}else{
    print("no")
}

//二つの配列（比較対象の配列と選択された配列）を引数として判定結果を返すメソッド
func check(board : [Int] ,selected : [Int]) ->String{
    var count = 0
    for i in 0..<board.count{
        for j in 0..<board.count{
            if board[i] == board[j]{
                count += 1
                break
            }
        }
    }
    if count == board.count{
        
        return "yes"
        
        
    }else{
        
        return "no"
    }
}

//for i3 in 0..<n{
//    print(selectArray[i3])
//}
