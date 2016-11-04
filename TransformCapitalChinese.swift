//
//  TransformCapitalChinese.swift
//  TransformCapCNDemo
//
//  Created by 王浩 on 16/11/4.
//  Copyright © 2016年 uniproud. All rights reserved.
//

import Foundation

public class TransformCapitalChinese {
    
    /*  阿拉伯数字 转 中文大写数字
     *  numFloat : 要转换的float型
     *  中文大写 ：壹、贰、叁、肆、伍、陆、柒、捌、玖、拾、佰、仟、万、亿、元(圆)、角、分、 零
     *  return ： 返回的大写字符串
     */
    public class func getCapitalChinaString(numFloat:Float) -> String {
        
        var resultString = ""
        var transferNumInt = Int(numFloat)  //待转换数字整数部分
        var transferNumDec = ((Int(numFloat*1000))%1000)/10 //待转换数字小数部分,为了避免转换准确，才如此
        let zeroToNineArray = ["零","壹","贰","叁","肆","伍","陆","柒","捌","玖"]
        
        
        if transferNumInt > 1000000000 {
            return "大于十亿"
        }
        //将一万以内的数转换成中文大写
        func transforZeroToThousandCapital(number:Int)->String {
            
            //只处理10000以内的数
            if number >= 10000 {
                return ""
            }
            var zeroToThousand = ""
            
            
            
            //千位
            var numberInt = number  //可变的数字
            if numberInt/1000 != 0 {  //千位不是0
                zeroToThousand += zeroToNineArray[numberInt/1000]
                zeroToThousand += "仟"
            } else {  //千位是0，百位不是零，才加 ‘零’
                if numberInt/100 != 0 {
                    zeroToThousand += "零"
                }
            }
            
            
            //百位
            numberInt %= 1000
            if numberInt/100 != 0 {
                zeroToThousand += zeroToNineArray[numberInt/100]
                zeroToThousand += "佰"
            } else {  //百位是0，十位不是零，才加 ‘零’
                if numberInt/10 != 0 {
                    zeroToThousand += "零"
                }
            }
            
            //十位
            numberInt %= 100
            if numberInt/10 != 0 {
                zeroToThousand += zeroToNineArray[numberInt/10]
                zeroToThousand += "拾"
            } else {  //十位是0，个位不是零并且大于10，才加 ‘零’
                if numberInt != 0 && number > 10 {
                    zeroToThousand += "零"
                }
            }
            
            //个位
            numberInt %= 10
            if numberInt != 0 {
                zeroToThousand += zeroToNineArray[numberInt]
            }
            
            return zeroToThousand
        }
        //以下只管处理100亿以下的
        //如果大于等于1亿
        if transferNumInt >= 100000000 {
            resultString += transforZeroToThousandCapital(transferNumInt/100000000)
            resultString += "亿"
            transferNumInt %= 100000000
        }
        
        //如果大于等于1万
        if transferNumInt >= 10000 {
            resultString += transforZeroToThousandCapital(transferNumInt/10000)
            resultString += "万"
            transferNumInt %= 10000
        }
        
        //0到一万之间
        if transferNumInt >= 1 {
            resultString += transforZeroToThousandCapital(transferNumInt)
            resultString += "元"
        }
        
        
        if transferNumDec != 0{
            resultString += "零"
            //下数点后第一
            if transferNumDec/10 != 0 {
                resultString += zeroToNineArray[transferNumDec/10]
                resultString += "角"
            }
            
            //小数点后第二位
            transferNumDec %= 10
            if transferNumDec != 0 {
                resultString += zeroToNineArray[transferNumDec]
                resultString += "分"
            }
        } else {
            resultString += "整"
        }
        
        //如果整体把最前面多余的 ‘零’去掉
        while resultString.hasPrefix("零") {
            resultString.removeAtIndex(resultString.startIndex)
        }
        
        return resultString
        
    }
    
}


