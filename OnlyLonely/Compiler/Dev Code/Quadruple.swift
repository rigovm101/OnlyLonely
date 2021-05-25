//
//  Quadruple.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 30/04/21.
//

import Foundation

class Quadruple {
    var operationCode : String
    var leftOperand : Int
    var rightOperand : Int
    var result : String
    
    init(_ operationCode: String, _ leftOperand: Int, _ rightOperand: Int, _ result: String) {
        self.operationCode = operationCode
        self.leftOperand = leftOperand
        self.rightOperand = rightOperand
        self.result = result
    }
    
    func setResult(_ result: String){
        self.result = result
    }
}
