//
//  OrderedSetTests.swift
//
//  Created by Qua Zi Xian on 20/3/15.
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

import Foundation
import XCTest

class OrderedSetTests: XCTestCase {
    func testConstructor() {
        let set = OrderedSet<Int>()
        XCTAssertTrue(set.isEmpty)
    }
    
    func testInsert() {
        let set = OrderedSet<Int>()
        let values = [7, 10, 13, 17, 15, 5, 4, 14, 16, 2, 6, 3, 1, 15, 8, 9] //These values cause all possible balancing rotations
        for value in values {
            set.insert(value)
        }
        for value in values {
            XCTAssertTrue(set.contains(value))
        }
        XCTAssertEqual(set.size, 15)
    }
    
    func testSmallestElement() {
        let set = OrderedSet<Int>()
        let values = [7, 10, 13, 17, 15, 5, 4, 14, 16, 2, 6, 3, 1, 15, 8, 9]
        XCTAssertTrue(set.smallestElement == nil)
        
        for value in values {
            set.insert(value)
        }
        XCTAssertEqual(set.smallestElement!, 1)
    }
    
    func testLargestElement() {
        let set = OrderedSet<Int>()
        let values = [7, 10, 13, 17, 15, 5, 4, 14, 16, 2, 6, 3, 1, 15, 8, 9]
        XCTAssertTrue(set.largestElement == nil)
        
        for value in values {
            set.insert(value)
        }
        XCTAssertEqual(set.largestElement!, 17)
    }
    
    func testErase() {
        let set = OrderedSet<Int>()
        let values = [7, 10, 13, 17, 15, 5, 4, 14, 16, 2, 6, 3, 1, 15, 8, 9]
        
        for value in values {
            set.insert(value)
        }
        XCTAssertEqual(set.size, 15)
        
        //Tests removal as well as handling of duplicates in insertion.
        set.erase(15)
        XCTAssertFalse(set.contains(15))
        XCTAssertEqual(set.size, 14)
        
        //Tests removal of element with 2 children, causing rotation at successor's parent.
        //Rotation/Balancing is only for efficiency but is complicated.
        //Hard to test for correctness except by testing for regressions caused by balancing.
        set.erase(5)
        XCTAssertEqual(set.size, 13)
        XCTAssertFalse(set.contains(5))
        
        //Tests removal of non-existent element
        set.erase(15)
        XCTAssertEqual(set.size, 13)
        
        //Tests removal of element with only left child
        set.erase(2)
        XCTAssertEqual(set.size, 12)
        XCTAssertFalse(set.contains(2))
        
        //Tests removal of element with only left child
        set.erase(13)
        XCTAssertEqual(set.size, 11)
        XCTAssertFalse(set.contains(13))
        
        //Tests removal of smallest element and leaf.
        set.erase(1)
        XCTAssertEqual(set.size, 10)
        XCTAssertFalse(set.contains(1))
        XCTAssertEqual(set.smallestElement!, 3)
        
        //Removal of element with 2 children, with the successor being the right child.
        set.erase(8)
        set.erase(9)
        
        //This causes left rotation about 3, followed by right rotation about 6.
        set.erase(7)
        XCTAssertEqual(set.size, 7)
        
        //Removal of root
        set.erase(10)
        XCTAssertEqual(set.size, 6)
        XCTAssertFalse(set.contains(10))
        
        //Removal of largest element
        set.erase(17)
        XCTAssertEqual(set.size, 5)
        XCTAssertFalse(set.contains(17))
        XCTAssertEqual(set.largestElement!, 16)
        
        //Cause right rotation about the root
        set.erase(16)
        
        //Cause left rotation about root
        set.erase(3)
        XCTAssertEqual(set.size, 3)
        
        //Removes the remaining elements
        set.erase(4)
        set.erase(14)
        set.erase(6)
        XCTAssertTrue(set.isEmpty)
    }
    
    func testInOrderTraversal() {
        let set = OrderedSet<Int>()
        let unsortedArr = [5, 2, 6, 8, 13, 77, 1, 16]
        let sortedArr = [1, 2, 5, 6, 8, 13, 16, 77]
        
        for val in unsortedArr {
            set.insert(val)
        }
        
        XCTAssertEqual(set.toSortedArray(), sortedArr)
    }
    
    func testClear() {
        let set = OrderedSet<Int>()
        let unsortedArr = [5, 2, 6, 8, 13, 77, 1, 16]
        let sortedArr = [1, 2, 5, 6, 8, 13, 16, 77]
        
        for val in unsortedArr {
            set.insert(val)
        }
        
        XCTAssertEqual(set.toSortedArray(), sortedArr)
        
        set.clear()
        XCTAssertTrue(set.toSortedArray().isEmpty)
        
        set.insert(3)
        XCTAssertEqual(set.toSortedArray(), [3])
    }
    
    func testLowerBound() {
        let set = OrderedSet<Int>()
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
        
        for prime in primes {
            set.insert(prime)
        }
        
        XCTAssertEqual(set.lowerBound(13)!, 13)     //Test border case of lowerBound function
        XCTAssertEqual(set.lowerBound(15)!, 17)
        XCTAssertTrue(set.lowerBound(38) == nil)    //No element is greater than or equal to 38 in the set
    }
    
    func testUpperBound() {
        let set = OrderedSet<Int>()
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
        
        for prime in primes {
            set.insert(prime)
        }
        
        XCTAssertEqual(set.upperBound(13)!, 17)
        XCTAssertEqual(set.upperBound(20)!, 23)
        XCTAssertTrue(set.upperBound(37) == nil)
    }
}
