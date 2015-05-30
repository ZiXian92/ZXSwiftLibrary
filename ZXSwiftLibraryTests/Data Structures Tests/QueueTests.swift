//
//  QueueTests.swift
//  ZXSwiftLibrary
//
//  Created by Qua Zi Xian on 30/5/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

import Foundation
import XCTest

class QueueTests: XCTestCase {
    func testEnqueue() {
        let q = Queue<Int>()
        let input = [1, 2, 3, 4, 5]
        
        XCTAssertTrue(q.isEmpty)
        XCTAssertEqual(q.count, 0)
        
        for num in input {
            q.enqueue(num)
        }
        XCTAssertEqual(q.count, 5)
        XCTAssertFalse(q.isEmpty)
        XCTAssertEqual(q.toArray(), input)
    }
    
    func testDequeue() {
        let q = Queue<Int>()
        let input = [1, 2, 3, 4, 5]
        
        for num in input {
            q.enqueue(num)
        }
        XCTAssertEqual(q.count, 5)
        XCTAssertFalse(q.isEmpty)
        XCTAssertEqual(q.peek()!, 1)
        
        q.dequeue()
        XCTAssertEqual(q.peek()!, 2)
        XCTAssertEqual(q.count, 4)
        
        q.dequeue()
        XCTAssertEqual(q.peek()!, 3)
        XCTAssertEqual(q.count, 3)
        
        q.dequeue()
        XCTAssertEqual(q.peek()!, 4)
        XCTAssertEqual(q.count, 2)
        
        q.dequeue()
        XCTAssertEqual(q.peek()!, 5)
        XCTAssertEqual(q.count, 1)
        
        q.dequeue()
        XCTAssertTrue(q.isEmpty)
        XCTAssertEqual(q.count, 0)
        XCTAssertNil(q.peek())
        
        // Dequeue from empty queue
        q.dequeue()
        XCTAssertTrue(q.isEmpty)
        XCTAssertEqual(q.count, 0)
        XCTAssertNil(q.peek())
    }
    
    func testClear() {
        let q = Queue<Int>()
        let input = [1, 2, 3, 4, 5]
        
        for num in input {
            q.enqueue(num)
        }
        XCTAssertEqual(q.count, 5)
        XCTAssertFalse(q.isEmpty)
        
        q.clear()
        XCTAssertTrue(q.isEmpty)
        XCTAssertEqual(q.count, 0)
    }
}