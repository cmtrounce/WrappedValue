//
//  WrappedValue+Equatable.swift
//  Nimble
//
//  Created by Callum Trounce on 01/11/2018.
//

import Foundation

extension WrappedValue: Equatable where T: Equatable {
    
    public static func ==(_ l: WrappedValue, _ r: WrappedValue) -> Bool {
        return l.value == r.value
    }
}
