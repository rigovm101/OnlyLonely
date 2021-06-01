//
//  Quadruple.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 30/04/21.
//

import Foundation

/// Quadruple
/// - Description: This class is used to create the intermediate code in the compilation process
public class Quadruple {
    var operationCode : String
    var leftOperand : String
    var rightOperand : String
    var result : String
    
    /// Initializer
    /// - Parameters:
    ///   - operationCode: Operation to perform in run-time
    ///   - leftOperand: Address of the left operand
    ///   - rightOperand: Address of the right operand
    ///   - result: Address to save the result
    init(_ operationCode: String, _ leftOperand: String, _ rightOperand: String, _ result: String) {
        self.operationCode = operationCode
        self.leftOperand = leftOperand
        self.rightOperand = rightOperand
        self.result = result
    }
    
    /// setResult
    /// - Parameter result: Address of the result
    /// - Description: Modifies the last element of the Quadruple
    func setResult(_ result: String){
        self.result = result
    }
}
