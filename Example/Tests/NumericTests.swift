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
            context("with random values") {
                let allValues = [Int](-10...10)
                
                allValues.forEach { n1 in
                    allValues.forEach { n2 in
                        
                        let value1 = WrappedValue<Int>.init(integerLiteral: n1)
                        let value2 = WrappedValue<Int>.init(integerLiteral: n2)
                        
                        it("can be added") {
                            let result = value1 + value2
                            expect(result.value) == n1 + n2
                        }
                        
                        it("can be multiplied") {
                            let result = value1 * value2
                            expect(result.value) == n1 * n2
                        }
                        
                        it("can be taken away") {
                            let result = value1 - value2
                            expect(result.value) == n1 - n2
                        }
                    }
                }
            }
        }
    }
}
