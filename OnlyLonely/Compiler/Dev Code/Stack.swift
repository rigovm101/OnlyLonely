//
//  Stack.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 30/04/21.
//

import Foundation

/// Stack
/// - Description: This class is used to store elements in execution.
struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    /// push
    /// - Parameter element: Element to add
    /// - Description: Adds the element to the stack
    mutating func push(_ element: Element) {
        array.append(element)
        
    }
    
    /// pop
    /// - Returns: Element on top
    /// - Description: This function removes the top element from the stack
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    /// simplePop
    /// - Description: This funciton removes the top element from the stack without returning it, implemented to silence compiler warnings
    mutating func simplePop() {
        _ = array.popLast()
    }
    
    /// top
    /// - Returns: The top element of the stack
    /// - Description: This function returns the element on the top without removing it
    func top() -> Element? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
}
