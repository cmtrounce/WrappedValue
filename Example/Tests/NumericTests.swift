//
//  NumericTests.swift
//  WrappedValue_Tests
//
//  Created by Callum Trounce on 01/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import WrappedValue

class NumericSpec: QuickSpec {
    
    override func spec() {
        describe("WrappedValue can be treated like a Numeric value") {
            
            it("can be added") {
                let value1 = WrappedValue<Int>.init(integerLiteral: 2)
                let value2 = WrappedValue<Int>.init(integerLiteral: 4)
                let result = value1 + value2
                expect(result.value) == 6
            }
            
            it("can be multiplied") {
                let value1 = WrappedValue<Int>.init(integerLiteral: 2)
                let value2 = WrappedValue<Int>.init(integerLiteral: 4)
                let result = value1 * value2
                expect(result.value) == 8
            }
            
            it("can be taken away") {
                let value1 = WrappedValue<Int>.init(integerLiteral: 2)
                let value2 = WrappedValue<Int>.init(integerLiteral: 4)
                let result = value1 - value2
                expect(result.value) == -2
            }
            
        }
    }
}
