//
//  check.swift
//  WordBingoGame
//
//  Created by 近藤元気 on 2020/09/16.
//  Copyright © 2020 genkikondo. All rights reserved.
//

import Foundation
class Check {
    var board :[Int] = []
    var selected :[Int] = []
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
}
