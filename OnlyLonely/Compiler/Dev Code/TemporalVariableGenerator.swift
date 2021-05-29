//
//  TemporalVariableGenerator.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 30/04/21.
//

import Foundation

class TemporalVariableGenerator{
    var counter : Int
    
    var globalInt : Int
    var globalFloat : Int
    var globalChar : Int
    
    var localInt : Int
    var localFloat : Int
    var localChar : Int
    
    var tempInt : Int
    var tempFloat : Int
    var tempChar : Int
    var tempBool : Int
    
    var constInt : Int
    var constFloat : Int
    var constChar : Int
    var constString : Int
    
    init() {
        counter = 0
        
        globalInt = 0
        globalFloat = 0
        globalChar = 0
        
        localInt = 0
        localFloat = 0
        localChar = 0
        
        tempInt = 0
        tempFloat = 0
        tempChar = 0
        tempBool = 0
        
        constInt = 0
        constFloat = 0
        constChar = 0
        constString = 0
    }
    
    //Global Variables
    func getGlobalInt() -> String{
        globalInt = globalInt + 1
        return String(globalInt)
    }
    
    func getGlobalFloat() -> String{
        globalFloat = globalFloat + 1
        return String(3300 + globalFloat)
    }
    
    func getGlobalChar() -> String{
        globalChar = globalChar + 1
        return String(6600 + globalChar)
    }
    
    func getGlobalVar(_ type : String) -> String{
        switch type {
        case "entero":
            return getGlobalInt()
        case "flotante":
            return getGlobalFloat()
        case "char":
            return getGlobalChar()
        default:
            return "-1"
        }
    }
    
    func getGlobalArray(_ type : String, _ size : String) -> String{
        let tSize = Int(size)
        let startPos = getGlobalVar(type)
        switch type {
        case "entero":
            globalInt += tSize! - 1
        case "flotante":
            globalFloat += tSize! - 1
        case "char":
            globalChar += tSize! - 1
        default:
            print("Error de Arreglo")
        }
        return startPos
    }
    
    //Local Variables
    func getLocalInt() -> String{
        localInt = localInt + 1
        return String(10000 + localInt)
    }
    
    func getLocalFloat() -> String{
        localFloat = localFloat + 1
        return String(13300 + localFloat)
    }
    
    func getLocalChar() -> String{
        localChar = localChar + 1
        return String(16600 + localChar)
    }
    
    func getLocalVar(_ type : String) -> String{
        switch type {
        case "entero":
            return getLocalInt()
        case "flotante":
            return getLocalFloat()
        case "char":
            return getLocalChar()
        default:
            return "-1"
        }
    }
    
    func getLocalArray(_ type : String, _ size : String) -> String{
        let tSize = Int(size)
        let startPos = getLocalVar(type)
        switch type {
        case "entero":
            localInt += tSize! - 1
        case "flotante":
            localFloat += tSize! - 1
        case "char":
            localChar += tSize! - 1
        default:
            print("Error de Arreglo")
        }
        return startPos
    }
    
    //Temporal Variables
    func getTempInt() -> String{
        counter += 1
        tempInt = tempInt + 1
        return String(20000 + tempInt)
    }
    
    func getTempFloat() -> String{
        counter += 1
        tempFloat = tempFloat + 1
        return String(21250 + tempFloat)
    }
    
    func getTempChar() -> String{
        counter += 1
        tempChar = tempChar + 1
        return String(22500 + tempChar)
    }
    
    func getTempBool() -> String{
        counter += 1
        tempBool = tempBool + 1
        return String(23750 + tempBool)
    }
    
    func getTempVar(_ type : String) -> String{
        switch type {
        case "entero":
            return getTempInt()
        case "flotante":
            return getTempFloat()
        case "char":
            return getTempChar()
        case "bool":
            return getTempBool()
        default:
            return "-1"
        }
    }
    
    //Constants
    func getConstInt() -> String{
        constInt = constInt + 1
        return String(25000 + constInt)
    }
    
    func getConstFloat() -> String{
        constFloat = constFloat + 1
        return String(26600 + constFloat)
    }
    
    func getConstChar() -> String{
        constChar = constChar + 1
        return String(28300 + constChar)
    }
    
    func getConstString() -> String{
        constString = constString + 1
        return String(30000 + constString)
    }
    
    func getConst(_ type : String) -> String{
        switch type {
        case "entero":
            return getConstInt()
        case "flotante":
            return getConstFloat()
        case "char":
            return getConstChar()
        case "string":
            return getConstString()
        default:
            return "-1"
        }
    }
    
    func reset() {
        counter = 0
        tempInt = 0
        tempFloat = 0
        tempChar = 0
        tempBool = 0
        
        localInt = 0
        localFloat = 0
        localChar = 0
    }
}
