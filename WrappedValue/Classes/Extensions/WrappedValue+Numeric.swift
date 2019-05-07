//
//  WrappedValue+Numbers.swift
//  Nimble
//
//  Created by Callum Trounce on 01/11/2018.
//

import Foundation

extension WrappedValue: ExpressibleByIntegerLiteral where T: ExpressibleByIntegerLiteral, T.IntegerLiteralType: Wrappable {
    
    public typealias IntegerLiteralType = T.IntegerLiteralType
    public init(integerLiteral value: T.IntegerLiteralType) {
        self.init(value: T.init(integerLiteral: value))
    }
}

#if(compiler(<5))
extension WrappedValue: Numeric where T: Numeric, T.IntegerLiteralType: Wrappable {
    
    public typealias Magnitude = T.Magnitude
    
    public var magnitude: Magnitude { return value.magnitude }
    
    public init?<U>(exactly source: U) where U : BinaryInteger {
        guard let exactValue = T(exactly: source) else {
            return nil
        }
        self = WrappedValue.init(value: exactValue)
    }
    
    public static func + (_ lhs: WrappedValue, _ rhs: WrappedValue) -> WrappedValue {
        return WrappedValue.init(value: lhs.value + rhs.value)
    }
    
    public static func +=(_ lhs: inout WrappedValue, rhs: WrappedValue) {
        lhs = WrappedValue.init(value: lhs.value + rhs.value)
    }
    
    public static func * (lhs: WrappedValue<T>, rhs: WrappedValue<T>) -> WrappedValue<T> {
        return WrappedValue.init(value: lhs.value * rhs.value)
    }
    
    public static func *= (lhs: inout WrappedValue<T>, rhs: WrappedValue<T>) {
        lhs = WrappedValue.init(value: lhs.value * rhs.value)
    }
    
    public static func - (lhs: WrappedValue<T>, rhs: WrappedValue<T>) -> WrappedValue<T> {
        return WrappedValue.init(value: lhs.value - rhs.value)
    }
    
    public static func -= (lhs: inout WrappedValue<T>, rhs: WrappedValue<T>) {
        lhs = WrappedValue.init(value: lhs.value - rhs.value)
    }
}
#else
extension WrappedValue: AdditiveArithmetic where T: AdditiveArithmetic {
    
    public static var zero: WrappedValue<T> { return WrappedValue(value: T.zero) }
    
    public static func + (_ lhs: WrappedValue, _ rhs: WrappedValue) -> WrappedValue {
        return WrappedValue.init(value: lhs.value + rhs.value)
    }
    
    public static func +=(_ lhs: inout WrappedValue, rhs: WrappedValue) {
        lhs = WrappedValue.init(value: lhs.value + rhs.value)
    }
    
    public static func - (lhs: WrappedValue<T>, rhs: WrappedValue<T>) -> WrappedValue<T> {
        return WrappedValue.init(value: lhs.value - rhs.value)
    }
    
    public static func -= (lhs: inout WrappedValue<T>, rhs: WrappedValue<T>) {
        lhs = WrappedValue.init(value: lhs.value - rhs.value)
    }
}

extension WrappedValue: Numeric where T: Numeric, T.IntegerLiteralType: Wrappable {
    
    public typealias Magnitude = T.Magnitude
    
    public var magnitude: Magnitude { return value.magnitude }
    
    public init?<U>(exactly source: U) where U : BinaryInteger {
        guard let exactValue = T(exactly: source) else {
            return nil
        }
        self = WrappedValue.init(value: exactValue)
    }
    
    public static func * (lhs: WrappedValue<T>, rhs: WrappedValue<T>) -> WrappedValue<T> {
        return WrappedValue.init(value: lhs.value * rhs.value)
    }
    
    public static func *= (lhs: inout WrappedValue<T>, rhs: WrappedValue<T>) {
        lhs = WrappedValue.init(value: lhs.value * rhs.value)
    }
}
#endif
