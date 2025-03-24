//
//  class.swift
//  calc
//
//  Created by Margarita Dowd Uthurralt on 24/3/2025.
//  Copyright © 2025 UTS. All rights reserved.
//

import Foundation

// class

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
    
    /// Perform Addition
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    
    
    // method for addition
    
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    
    // method for subtraction
    
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2
    }
    
    
    // method for multiplication
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2
    }
    
    
    // method for division
    
    func divide(no1: Int, no2: Int) -> Int {
        guard no2 != 0 else {
            fatalError("Error: division by zero not allowed")
        }
        return no1 / no2
    }
    
    func leftOrRight(_ args: [String]) -> Int {
        var tokens = args
        
        // phase 1 - multiplications and divisions
        var index = 0
        while index < tokens.count {
            if tokens[index] == "*" || tokens [index] == "/"{
                let left = Int(tokens[index - 1])!
                let right = Int(tokens[index + 1])!
                let result = tokens[index] == "*" ?  multiply(no1: left, no2: right) : divide(no1: left, no2: right)
                
                tokens.replaceSubrange(index-1...index+1, with: [String(result)])
                index -= 1
            }
            index += 1
        }
        
        //phase 2 - addition and subtraction
        index = 0
        while index < tokens.count {
            if tokens[index] == "+" || tokens [index] == "-"{
                let left = Int(tokens[index - 1])!
                let right = Int(tokens[index + 1])!
                let result = tokens[index] == "+" ? add(no1: left, no2: right) : subtract(no1: left, no2: right)
                tokens.replaceSubrange(index-1...index+1, with: [String(result)])
                index -= 1
            }
            index += 1
        }
        
        return Int(tokens.first!)!
    }
    
    func calculate(args: [String]) -> String {
        let result = leftOrRight(args)
        return String(result)
    }
}

