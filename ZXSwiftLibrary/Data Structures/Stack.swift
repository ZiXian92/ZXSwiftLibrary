//
//  Stack.swift
//
//  Copyright (c) 2015 ZXLabs All rights reserved.
//

/**
    Defines a last-in-first-out data structure.
 */
public class Stack<T> {
    private var top: ListNode<T>?
    private var size: Int
    
    public init(){
        top = nil
        size = 0
    }
    
    /**
        Adds an element to the top of the stack.

        :param: elem The element to be inserted.
     */
    public func push(item: T) {
        var newTop = ListNode<T>(value: item, prev: top)
        if top != nil {
            top!.next = newTop
        }
        top = newTop
        size++
    }
    
    /**
        Removes the element at the top of the stack.

        :returns: The element at the top of the stack, or nil if the stack is empty.
     */
    public func pop() -> T? {
        if isEmpty {
            return nil
        }
        let val = top!.value
        top = top?.prev
        if top != nil {
            top!.next = nil
        }
        size--
        return val
    }
    
    /**
        Gets, but does not remove, the element at the top of the stack.
    
        :returns: The element at the top of the stack, or nil if the stack is empty.
     */
    public func peek() -> T? {
        return top?.value
    }
    
    /**
        The number of elements currently in the stack.
     */
    public var count: Int {
        return size
    }
    
    /**
        True if the stack is empty and false otherwise.
     */
    public var isEmpty: Bool {
        return size == 0
    }
    
    /**
        Removes all elements in the stack.
     */
    public func clear() {
        while top != nil {
            top!.next = nil
            top = top!.prev
        }
        size = 0
    }
    
    /**
        Represents the stack as an array.

        :returns: An array of elements of the stack in the order
        that they are popped i.e. first element in the array
        is the first element popped.
     */
    public func toArray() -> [T] {
        var arr = [T]()
        var itr = top
        
        while itr != nil {
            arr.append(itr!.value)
            itr = itr!.prev
        }
        
        return arr
    }
}
