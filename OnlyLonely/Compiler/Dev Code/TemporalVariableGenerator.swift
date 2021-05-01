//
//  TemporalVariableGenerator.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 30/04/21.
//

import Foundation

class TemporalVariableGenerator{
    var counter : Int
    
    init() {
        counter = 0
    }
    
    func getTemporalVariable() -> String {
        let varName = "t\(counter)"
        counter += 1
        return varName
    }
    
    func reset() {
        counter = 0
    }
}
