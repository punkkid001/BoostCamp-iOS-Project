//
//  UpDownGame.swift
//  UpDownGame
//
//  Created by Jiyoon on 2017. 1. 25..
//  Copyright © 2017년 Jiyoon. All rights reserved.
//

import Foundation

class UpDownGame {
    
    enum GameResult : Int {
        case up=0
        case down
        case gameOver
        case right
    }
    
    var randNum: UInt32 = 0
    var gameMode: Int   // gameMode 5: 1-10 / 10: 1-50 / 20: 1-100
    var count: Int = 0
    
    init(max: Int) {
        gameMode = max<=10 ? 5 : 10
        gameMode = max<=50 ? gameMode : 20
        
        randNum = makeSeed(UInt32(max))
    }
    
    func makeSeed(_ seed: UInt32) -> UInt32 {
        return arc4random_uniform(seed) + 1
    }
    
    func isIt(_ answer: Int) -> String{
        let game = makeUpDownGame()
        let result = game(answer)
        
        if result == GameResult.up {
            return "Up"
        }
            
        else if result == GameResult.down {
            return "Down"
        }
            
        else if result == GameResult.right {
            return "Right"
        }
            
        else {
            return "Game Over"
        }
    }
    
    func makeUpDownGame() -> ((Int) -> GameResult) {
        
        return {(_ input: Int) -> GameResult in
            var result: GameResult = GameResult.gameOver
            
            if self.count<self.gameMode - 1 {
                if UInt32(input) == self.randNum {
                    result = GameResult.right
                }
                    
                else if UInt32(input) < self.randNum {
                    result = GameResult.down
                }
                    
                else {
                    result = GameResult.up
                }
            }
                
            else {
                if UInt32(input) == self.randNum {
                    result = GameResult.right
                }
                else {
                    result = GameResult.gameOver
                }
            }
            
            self.count += 1
            print(self.count)
            
            return result
        }
    }
}
