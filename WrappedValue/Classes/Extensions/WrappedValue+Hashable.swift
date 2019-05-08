//
//  WrappedValue+Hashable.swift
//  Nimble
//
//  Created by Callum Trounce on 01/11/2018.
//

import Foundation

extension WrappedValue: Hashable where T: Hashable {
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(value)
    }
    
    public var hashValue: Int {
        return value.hashValue
    }
}
