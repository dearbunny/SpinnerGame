//
//  wheelImageView.swift
//  Spinner轉盤
//
//  Created by ROSE on 2021/5/1.
//

import UIKit

class wheelImageView: UIImageView {

    var currentValue: Double = 0
    func rotateGradually(handler:@escaping (String) -> ()) {
        var result = ""
        let randomDouble = Double.random(in: 0..<2 * Double.pi) // 產生0~2pi隨機的Double數字,也就是0~360度。
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        CATransaction.begin()
        rotateAnimation.fromValue = currentValue
        currentValue = currentValue + 100 * Double.pi + randomDouble //開始到結束之,總共了50圈加上randomDouble度。
        let value = currentValue.truncatingRemainder(dividingBy: Double.pi * 2) //取得currentale/Doublepi*2餘數
        let degree = value * 180 / Double.pi //將弧度轉成角度
        switch degree{ //依照不同角度判斷轉到區塊
            case 0..<30:
            result="12"
            case 30..<60:
            result="11"
            case 60..<90:
            result="10"
            case 90..<120:
            result="9"
            case 120..<150:
            result="8"
            case 150..<180:
            result="7"
            case 180..<210:
            result="6"
            case 210..<240:
            result="5"
            case 240..<270:
            result="4"
            case 270..<300:
            result="3"
            case 300..<330:
            result="2"
            case 333..<360:
            result="1"
            default:
            result="...未知"
        }
        rotateAnimation.toValue = currentValue
        rotateAnimation.isRemovedOnCompletion = false //動畫結束後仍保在結束狀態,讓轉盤不會在動畫結束時回到最初狀態。便繼再次轉動。
        rotateAnimation.fillMode = .forwards
        rotateAnimation.duration = 5 //動畫持續時間
        rotateAnimation.repeatCount = 1 // 重複幾次
        CATransaction.setCompletionBlock { //跑完動後要做的事
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){//動畫結束後暫停0.3秒
                handler(result)
            }
        }
        rotateAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0, 0.9, 0.4, 1.00)//用cubic Bezier curve決定動畫速率曲線
        //也可以用內建的easeOut,但我想要最後轉一點
        self.layer.add(rotateAnimation, forKey: nil)
        CATransaction.commit()
    }
}
