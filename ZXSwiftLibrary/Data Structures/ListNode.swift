//
//  ListNode.swift
//
//  Created by quazx on 15/1/15.
//  Copyright (c) 2015 NUS CS3217. All rights reserved.
//

import Foundation

class ListNode<T>{
    var value: T
    var prev: ListNode<T>?
    var next: ListNode<T>?
    
    init(value: T, next: ListNode<T>?){
        self.value = value
        self.next = next
        self.prev = nil
    }
    
    init(value: T, prev: ListNode<T>? = nil, next: ListNode<T>? = nil){
        self.value = value
        self.prev = prev
        self.next = next
    }
}