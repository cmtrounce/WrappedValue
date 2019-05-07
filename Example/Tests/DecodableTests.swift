//
//  DecodableTests.swift
//  WrappedValue_Tests
//
//  Created by Callum Trounce on 02/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import WrappedValue

class DecodableSpec: QuickSpec {
    
    struct TestUser: Codable {
        let age: WrappedValue<Int>
    }
    
    override func spec() {
        
        let decoder = JSONDecoder()
        
        describe("WrappedValue can decode Strings to StringConvertable values") {
            
            context("Using a range of Int values", closure: {
                
                let integers = [Int](-100...100)
                
                integers.forEach { value in
                    
                    it("Can decode correct values", closure: {
                        
                        let validJSONData = "{ \"age\": \(value) }".data(using: .utf8)!
                        let equals = equal(WrappedValue<Int>.init(value: value))
                        
                        expect {
                            let decoded = try decoder.decode(TestUser.self,
                                                             from: validJSONData)
                            
                            return decoded.age
                            }.to(equals)
                    })
                    
                    it("Can decode convertable strings") {
                        let validJSONData = "{ \"age\": \"\(value)\" }".data(using: .utf8)!
                        let equals = equal(WrappedValue<Int>.init(value: value))
                        
                        expect {
                            let decoded = try decoder.decode(TestUser.self,
                                                             from: validJSONData)
                            
                            return decoded.age
                            }.to(equals)
                    }
                    
                    it("Will throw if it cannot decode", closure: {
                        let validJSONData = "{ \"age\": \"asdsadsadas\(value)asdsadsad\" }".data(using: .utf8)!
                      
                        expect {
                            let decoded = try decoder.decode(TestUser.self,
                                                             from: validJSONData)
                            
                            return decoded.age
                            }.toEventually(throwError())
                    })
                }
                
               
            })
        }
    }
}
