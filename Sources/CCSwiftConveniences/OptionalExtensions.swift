//
    /**
 *------------------------------------------------------------------
 * Copyright © 2020 HeNan DtCloud Network Technology Co.,Lt d.
 * ------------------------------------------------------------------
 * 类 名: OptionalExtensions.swift
 * 功 能:
 * 创建者: LeeZB@___ORGANIZATIONNAME___
 * 创建时间: 2020/7/13 3:23 PM
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

public extension Optional {
    
    /// 返回自身或者默认值的 optional
    ///
    ///        let foo: String? = nil
    ///        print(foo.unwrapped(or: "bar")) -> "bar"
    ///
    ///        let bar: String? = "bar"
    ///        print(bar.unwrapped(or: "foo")) -> "bar"
    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }
    
    /// 返回自身或抛出错误的 optional
    ///
    ///     let foo: String? = nil
    ///     try print(foo.unwrapped(or: MyError.notFound)) -> error: MyError.notFound
    ///
    ///     let bar: String? = "bar"
    ///     try print(bar.unwrapped(or: MyError.notFound)) -> "bar"
    func unwrapped(or error: Error) throws -> Wrapped {
        guard let wrapped = self else { throw error }
        return wrapped
    }
    
    
    /// 如果不为 nil,则执行 closure
    /// - Parameter closure: 需要执行的 closure
    ///
    ///         let foo: String? = nil
    ///         foo.run { unwrappedFoo
    ///             // block will never run sice foo is
    ///             print(unwrappedFoo)
    ///         }
    ///
    ///         let bar: String? = "bar"
    ///         bar.run { unwrappedBar in
    ///             // block will run sice bar is not nill
    ///             print(unwrappedBar) -> "bar"
    ///         }
    func run(_ closure: (Wrapped) -> Void) {
        _ = map(closure)
    }
    
    /// 当操作符右边的optional值不为nil时,才将右侧的值赋给左侧变量
    static func ??= (lhs: inout Optional, rhs: Optional) {
        guard let rhs = rhs else { return }
        lhs = rhs
    }
    
    /// 当操作符左边的optional为nil时,才将右侧的closure结果赋给左侧变量
    static func ?= (lhs: inout Optional, rhs: @autoclosure () -> Optional) {
        if lhs == nil {
            lhs = rhs()
        }
    }
    
}

public extension Optional where Wrapped: Collection {
    
    /// 判断可选序列是nil或空序列
    var isNilOrEmpty: Bool {
        guard let collection = self else { return true }
        return collection.isEmpty
    }
    
    /// 可选序列非nil且不为empty时才返回序列,否则返回nil
    var nonEmpty: Wrapped? {
        guard let collection = self else { return nil }
        guard !collection.isEmpty else { return nil }
        return collection
    }
    
}

public extension Optional where Wrapped: RawRepresentable, Wrapped.RawValue: Equatable {

    // swiftlint:disable missing_swifterswift_prefix
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func == (lhs: Optional, rhs: Wrapped.RawValue?) -> Bool {
        return lhs?.rawValue == rhs
    }

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func == (lhs: Wrapped.RawValue?, rhs: Optional) -> Bool {
        return lhs == rhs?.rawValue
    }

    /// Returns a Boolean value indicating whether two values are not equal.
    ///
    /// Inequality is the inverse of equality. For any values `a` and `b`,
    /// `a != b` implies that `a == b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func != (lhs: Optional, rhs: Wrapped.RawValue?) -> Bool {
        return lhs?.rawValue != rhs
    }

    /// Returns a Boolean value indicating whether two values are not equal.
    ///
    /// Inequality is the inverse of equality. For any values `a` and `b`,
    /// `a != b` implies that `a == b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func != (lhs: Wrapped.RawValue?, rhs: Optional) -> Bool {
        return lhs != rhs?.rawValue
    }

    // swiftlint:enable missing_swifterswift_prefix
}

infix operator ??= : AssignmentPrecedence
infix operator ?= : AssignmentPrecedence
