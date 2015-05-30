//
//  Queue.swift
//
//  Copyright (c) 2015 ZXLabs. All rights reserved.
//

/**
    Defines the queue data structure.
 */
public class Queue<T> {
    private var front: ListNode<T>?
    private var back: ListNode<T>?
    private var size: Int
    
    /**
     * Creates an empty queue.
     */
    public init(){
        front = nil
        back = nil
        size = 0
    }
    
    /**
        Adds an element to the tail of the queue.
        
        :param: elem The element to insert.
     */
    public func enqueue(elem: T) {
        if isEmpty {
            front = ListNode<T>(value: elem)
            back = front
        } else{
            back!.next = ListNode<T>(value: elem, prev: back)
            back = back!.next
        }
        self.size++
    }
    
    /**
        Removes an element the head of the queue.

        :returns: The 1st element in the queue, or nil if the queue is empty.
     */
    public func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        let val = front!.value
        front = front!.next
        if front != nil {
            front!.prev = nil
        } else {
            back = nil
        }
        size--
        return val
    }
    
    /**
        Gets the 1st element in the queue.
    
        :returns: The first element in the queue or nil if the queu is empty.
     */
    public func peek() -> T? {
        return isEmpty ? nil : front!.value
    }
    
    /**
        The number of elements currently in the queue.
     */
    public var count: Int {
        return size
    }
    
    /**
        Whether this queue is empty.
     */
    public var isEmpty: Bool {
        return size == 0
    }
    
    /**
        Removes all elements in the queue.
     */
    public func clear() {
        front = nil
        while back != nil {
            back = back!.prev
            if back != nil {
                back!.next = nil
            }
        }
        size = 0
    }
    
    /**
        Returns the array of elements of the queue in the order
        that they are dequeued i.e. first element in the array
        is the first element dequeued.
     
        :returns: An array with same order as this queue.
     */
    public func toArray() -> [T] {
        var arr = [T]()
        var itr = front
        while (itr != nil) {
            arr.append(itr!.value)
            itr = itr!.next
        }
        return arr
    }
    
    deinit {
        clear()
    }
}