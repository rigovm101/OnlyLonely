//
//  VirtualMachine.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 5/25/21.
//

import Foundation

class VirtualMachine {
    
    var memory : [Int : Int]
    var instructionPointer : Int
    var functionTable : [String : [String : String]]
    var constTable : [String : [String : String]]
    var quadruples : [Quadruple]
    
    init() {
        memory = [:]
        instructionPointer = 0
        functionTable = [:]
        constTable = [:]
        quadruples = []
    }
    
    init(_ functionTable : [String : [String : String]], _ constTable : [String : [String : String]], _ quadruples : [Quadruple]){
        memory = [:]
        instructionPointer = 0
        self.functionTable = functionTable
        self.constTable = constTable
        self.quadruples = quadruples
    }
}
