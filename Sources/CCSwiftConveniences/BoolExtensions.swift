//
    /**
 *------------------------------------------------------------------
 * Copyright © 2020 HeNan DtCloud Network Technology Co.,Lt d.
 * ------------------------------------------------------------------
 * 类 名: BoolExtensions.swift
 * 功 能:
 * 创建者: LeeZB@___ORGANIZATIONNAME___
 * 创建时间: 2020/7/10 4:13 PM
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

public extension Bool {
    
    var int: Int {
        return self ? 1 : 0
    }
    
    var string: String {
        return self ? "true" : "false"
    }
    
}
