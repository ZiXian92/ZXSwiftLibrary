# ZXSwiftLibrary
Data Structures and Miscellaneous Library Code for Swift  

This is a library consisting of commonly used data structures, as well as other utility classes which I have found useful after using it in my projects.

## How to Use
1. Download the **.framework** binary(to be made available in the coming days) into your project folder(Choose the appropriate version for your target build).
2. Add the binary to your Xcode project.
3. Add the library as an embedded binary in your project settings.  
 
# API Documentation
## Queue&lt;T&gt;
A first-in-first-out linear data structure.
### Properties
| Return Type | Property Name |
|-------------|---------------|
| Bool | isEmpty{ get } |
| Int | count{ get } |

### Methods
| Return Type | Method Signature | Description |
|-------------|------------------|-------------|
| Void | clear() | Empties the queue. |
| Void | dequeue() | Dequeues the first element in the queue. |
| Void | enqueue(elem: T) | Enqueus the given element. |
| T? | peek() | Gets the first element in the queue. |
| [T] | toArray() | Represents the queue as an array. |

## OrderedSet&lt;T: Comparable&gt;
An ordered collection of unique comparable elements. Implemented as a balanced Binary Search Tree.  
### Properties
| Return Type | Property Name |
|-------------|---------------|
| Bool | isEmpty{ get } |
| T? | largestElement{ get } |
| Int | size{ get } |
| T? | smallestElement{ get } |

### Methods
| Return Type | Method Signature | Description |
|-------------|------------------|-------------|
| Void | clear() | Removes all elements from the set. |
| Bool | contains(elem: T) | Checks if the given element is in the set. |
| Void | erase(elem: T) | Removes the specified element from the set. |
| Void | insert(elem: T) | Inserts the given element into the set. |
| T? | lowerBound(elem: T) | Finds the smallest element that is not less than the given element. |
| [T] | toSortedArray() | Presents this set as a sorted array. |
| T? | upperBound(elem: T) | Finds the smallest element that is greater than the given element. |

## OrderedMap&lt;K: Comparable, V&gt;
An ordered collection of key-value pairs, where keys are unique. Implemented as a balanced Binary Search Tree.  
### Properties
| Return Type | Property Name |
|-------------|---------------|
| Bool | isEmpty{ get } |
| K? | largestKey{ get } |
| Int | size{ get } |
| K? | smallestKey{ get } |
| V? | subscript(key: K){ get set } |
| V? | valueForLargestKey{ get } |
| V? | valueForSmallestKey{ get } |

### Methods
| Return Type | Method Signature | Description |
|-------------|------------------|-------------|
| Void | clear() | Removes all mappings. |
| Bool | containsKey(key: K) | Checks if a mapping exists for the given key. |
| Void | erase(key: K) | Removes mapping for the given key. |
| Void | insertValueForKey(key: K, value: V) | Maps the given value to the given key. |
| K? | lowerBoundOfKey(key: K) | Gets the smallest key that is not less than the given key. |
| [(K, V)] | toSortedArray() | Presents this map as a sorted array of key-value pairs. |
| K? | upperBoundOfKey(key: K) | Gets the smallest key that is greater than the given key. |
| V? | valueForKey(key: K) | Gets the value mapped to the given key. |
