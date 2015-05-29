# ZXSwiftLibrary
Data Structures and Miscellaneous Library Code for Swift  

This is a library consisting of commonly used data structures, as well as other utility classes which I have found useful after using it in my projects.

## How to Use
1. Download the **.framework** binary into your project folder(Choose the appropriate version for your target build).
2. Add the binary to your Xcode project.
3. Add the library as an embedded binary in your project settings.  
 
# API Documentation
## OrderedSet<T: Comparable>
An ordered collection of comparable elements. Implemented as a balanced Binary Search Tree.  
### Properties
| Return Type | Property Name |
|-------------|---------------|
| Int | size |
| Bool | isEmpty |
| T | smallestElement |
| T | largestElement |

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
