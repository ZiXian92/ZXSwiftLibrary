//
//  StackTests.swift
//  ZXSwiftLibrary
//
//  Created by Qua Zi Xian on 30/5/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

import Foundation
import XCTest

class Stacktests: XCTestCase {
    func testPush() {
        let s = Stack<Int>()
        let input = [1, 2, 3, 4, 5]
        
        XCTAssertTrue(s.isEmpty)
        XCTAssertEqual(s.count, 0)
        
        for num in input {
            s.push(num)
            XCTAssertFalse(s.isEmpty)
            XCTAssertEqual(s.peek()!, num)
        }
        XCTAssertEqual(s.count, 5)
    }
    
    func testPop() {
        let s = Stack<Int>()
        let input = [1, 2, 3, 4, 5]
        
        for num in input {
            s.push(num)
            XCTAssertFalse(s.isEmpty)
            XCTAssertEqual(s.peek()!, num)
        }

        XCTAssertFalse(s.isEmpty)
        XCTAssertEqual(s.count, 5)
        XCTAssertEqual(s.peek()!, 5)
        
        s.pop()
        XCTAssertEqual(s.peek()!, 4)
        XCTAssertFalse(s.isEmpty)
        XCTAssertEqual(s.count, 4)
        
        s.pop()
        XCTAssertEqual(s.peek()!, 3)
        XCTAssertFalse(s.isEmpty)
        XCTAssertEqual(s.count, 3)
        
        s.pop()
        XCTAssertEqual(s.peek()!, 2)
        XCTAssertFalse(s.isEmpty)
        XCTAssertEqual(s.count, 2)
        
        s.pop()
        XCTAssertEqual(s.peek()!, 1)
        XCTAssertFalse(s.isEmpty)
        XCTAssertEqual(s.count, 1)
        
        s.pop()
        XCTAssertNil(s.peek())
        XCTAssertTrue(s.isEmpty)
        XCTAssertEqual(s.count, 0)
        
        s.pop()
        XCTAssertNil(s.peek())
        XCTAssertTrue(s.isEmpty)
        XCTAssertEqual(s.count, 0)
    }
    
    func testClear() {
        let s = Stack<Int>()
        let input = [1, 2, 3, 4, 5]
        
        for num in input {
            s.push(num)
            XCTAssertFalse(s.isEmpty)
            XCTAssertEqual(s.peek()!, num)
        }
        
        XCTAssertFalse(s.isEmpty)
        XCTAssertEqual(s.count, 5)
        
        s.clear()
        XCTAssertTrue(s.isEmpty)
        XCTAssertEqual(s.count, 0)
    }
    
    func testToArray() {
        let s = Stack<Int>()
        let input = [1, 2, 3, 4, 5]
        
        for num in input {
            s.push(num)
            XCTAssertFalse(s.isEmpty)
            XCTAssertEqual(s.peek()!, num)
        }
        XCTAssertEqual(s.toArray(), input.reverse())
    }
}