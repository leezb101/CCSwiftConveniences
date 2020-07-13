//
    /**
 *------------------------------------------------------------------
 * Copyright © 2020 HeNan DtCloud Network Technology Co.,Lt d.
 * ------------------------------------------------------------------
 * 类 名: IntExtensions.swift
 * 功 能:
 * 创建者: LeeZB@___ORGANIZATIONNAME___
 * 创建时间: 2020/7/13 11:33 AM
 * 备 注:
 * ------------------------------------------------------------------
 * 修改历史
 * ------------------------------------------------------------------
 * 时间                      姓名                  备注
 * ------------------------------------------------------------------
 *
 * ------------------------------------------------------------------
 */
    

import Foundation
import CoreGraphics
import Darwin

public extension Int {
    var countableRange: CountableRange<Int> {
        return 0..<self
    }
    
    /// 度数转三角坐标角度
    var degreesToRadians: Double {
        return Double.pi * Double(self) / 180.0
    }
    
    /// 三角坐标角度转度数
    var radiansToDegrees: Double {
        return Double(self) * 180 / Double.pi
    }
    
    var uInt: UInt {
        return UInt(self)
    }
    
    var double: Double {
        return Double(self)
    }
    
    var float: Float {
        return Float(self)
    }
    
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
}

extension Int {
    
    /// 是否是质数
    func isPrime() -> Bool {
        if self == 2 { return true }
        
        guard self > 1 && self % 2 != 0 else { return false }
        
        let base = Int(sqrt(Double(self)))
        for int in Swift.stride(from: 3, through: base, by: 2) where self % int == 0 {
            return false
        }
        
        return true
    }
    
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence
func ** (lhs: Int, rhs: Int) -> Double {
    return pow(Double(lhs), Double(rhs))
}

prefix operator √
public prefix func √ (int: Int) -> Double {
    return sqrt(Double(int))
}
