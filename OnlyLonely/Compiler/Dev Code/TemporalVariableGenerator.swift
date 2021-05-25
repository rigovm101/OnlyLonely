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
    }
    
    //Global Variables
    func getGlobalInt() -> Int{
        globalInt = globalInt + 1
        return globalInt
    }
    
    func getGlobalFloat() -> Int{
        globalFloat = globalFloat + 1
        return 3300 + globalFloat
    }
    
    func getGlobalChar() -> Int{
        globalChar = globalChar + 1
        return 6600 + globalChar
    }
    
    func getGlobalVar(_ type : String) -> Int{
        switch type {
        case "entero":
            return getGlobalInt()
        case "flotante":
            return getGlobalFloat()
        case "char":
            return getGlobalChar()
        default:
            return -1
        }
    }
    
    func getGlobalArray(_ type : String, _ size : String) -> Int{
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
    func getLocalInt() -> Int{
        localInt = localInt + 1
        return 10000 + localInt
    }
    
    func getLocalFloat() -> Int{
        localFloat = localFloat + 1
        return 13300 + localFloat
    }
    
    func getLocalChar() -> Int{
        localChar = localChar + 1
        return 16600 + localChar
    }
    
    func getLocalVar(_ type : String) -> Int{
        switch type {
        case "entero":
            return getLocalInt()
        case "flotante":
            return getLocalFloat()
        case "char":
            return getLocalChar()
        default:
            return -1
        }
    }
    
    func getLocalArray(_ type : String, _ size : String) -> Int{
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
    func getTempInt() -> Int{
        counter += 1
        tempInt = tempInt + 1
        return 20000 + tempInt
    }
    
    func getTempFloat() -> Int{
        counter += 1
        tempFloat = tempFloat + 1
        return 21250 + tempFloat
    }
    
    func getTempChar() -> Int{
        counter += 1
        tempChar = tempChar + 1
        return 22500 + tempChar
    }
    
    func getTempBool() -> Int{
        counter += 1
        tempBool = tempBool + 1
        return 23750 + tempBool
    }
    
    func getTempVar(_ type : String) -> Int{
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
            return -1
        }
    }
    
    func getTemporalVariable() -> String {
        let varName = "t\(counter)"
        counter += 1
        return varName
    }
    
    func reset() {
        counter = 0
        tempInt = 0
        tempFloat = 0
        tempChar = 0
        tempBool = 0
    }
}
