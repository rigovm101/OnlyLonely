//
//  TemporalVariableGenerator.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 30/04/21.
//

import Foundation

/// TemporalVariableGenerator
/// - Description: This class serves as a memory allocation tool to asign variables in the compilation process. This class separates the Global, Local, Temporal and Constant variables used in the program
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
    
    /// Temporal Variable Generator Initializar
    /// - Description: Sets the counters of each type of variable to 0
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
    
    
    /// getGlobalInt
    /// - Returns: Address of the new variable
    /// - Description: This function gets the address for a Global Int
    func getGlobalInt() -> String{
        globalInt = globalInt + 1
        if globalInt > 3300 {
            fatalError("Error, demasiadas variables globales enteras declaradas")
        }
        return String(globalInt)
    }
    
    /// getGlobalFloat
    /// - Returns: Address of the new variable
    /// - Description: This function gets the address for a Global Float
    func getGlobalFloat() -> String{
        globalFloat = globalFloat + 1
        if globalFloat > 6600 {
            fatalError("Error, demasiadas variables globales flotantes declaradas")
        }
        return String(3300 + globalFloat)
    }
    
    /// getGlobalChar
    /// - Returns: Address of the new variable
    /// - Description: This function gets the address for a Global Char
    func getGlobalChar() -> String{
        globalChar = globalChar + 1
        if globalChar > 10000 {
            fatalError("Error, demasiadas variables globales char declaradas")
        }
        return String(6600 + globalChar)
    }
    
    /// getGlobalVar
    /// - Parameter type: Type of value requested
    /// - Returns: Address of the new variable
    /// - Description: This function gets the address for a Global variable
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
    
    /// getGlobalArray
    /// - Parameters:
    ///   - type: Type of array
    ///   - size: Size of array
    /// - Returns: Starting position of the array
    /// - Description: This function returns the starting position of an array and saves addresses for all the elements in the array
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
    
    
    /// getLocalInt
    /// - Returns: Address of the variable
    /// - Description: Gets the address for a new Local Integer
    func getLocalInt() -> String{
        localInt = localInt + 1
        if localInt > 13300 {
            fatalError("Error, demasiadas variables locales enteras declaradas")
        }
        return String(10000 + localInt)
    }
    
    /// getLocalFloat
    /// - Returns: Address of the variable
    /// - Description: Gets the address for a new Local Float
    func getLocalFloat() -> String{
        localFloat = localFloat + 1
        if localFloat > 16600 {
            fatalError("Error, demasiadas variables locales flotantes declaradas")
        }
        return String(13300 + localFloat)
    }
    
    /// getLocalChar
    /// - Returns: Address of the variable
    /// - Description: Gets the address for a new Local Char
    func getLocalChar() -> String{
        localChar = localChar + 1
        if localChar > 20000 {
            fatalError("Error, demasiadas variables locales char declaradas")
        }
        return String(16600 + localChar)
    }
    
    /// getLocalVar
    /// - Parameter type: Type of the variable to create
    /// - Returns: Address of the variable
    /// - Description: Creates a new Local variable
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
    
    /// getLocalArray
    /// - Parameters:
    ///   - type: Type of the array
    ///   - size: Size of the array
    /// - Returns: The starting position of the array
    /// - Description: Saves the addresses of all the elements in the array and returns the starting position
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
    
    
    /// getTempInt
    /// - Returns: Address of the variable
    /// - Description: Creates a Temporal Integer variable
    func getTempInt() -> String{
        counter += 1
        tempInt = tempInt + 1
        if tempInt > 21250 {
            fatalError("Error, demasiadas variables temporales enteras declaradas")
        }
        return String(20000 + tempInt)
    }
    
    /// getTempFloat
    /// - Returns: Address of the variable
    /// - Description: Creates a Temporal Float variable
    func getTempFloat() -> String{
        counter += 1
        tempFloat = tempFloat + 1
        if tempFloat > 22500 {
            fatalError("Error, demasiadas variables temporales flotantes declaradas")
        }
        return String(21250 + tempFloat)
    }
    
    /// getTempChar
    /// - Returns: Address of the variable
    /// - Description: Creates a Temporal Char variable
    func getTempChar() -> String{
        counter += 1
        tempChar = tempChar + 1
        if tempChar > 23750 {
            fatalError("Error, demasiadas variables temporales char declaradas")
        }
        return String(22500 + tempChar)
    }
    
    /// getTempBool
    /// - Returns: Address of the variable
    /// - Description: Creates a Temporal Bool variable
    func getTempBool() -> String{
        counter += 1
        tempBool = tempBool + 1
        if tempBool > 25000 {
            fatalError("Error, demasiadas variables temporales bool declaradas")
        }
        return String(23750 + tempBool)
    }
    
    /// getTempVar
    /// - Parameter type: Type of the variable
    /// - Returns: Address of the variable
    /// - Description: Creates a Temporal Variable and returns it's address
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
    
    /// getConstInt
    /// - Returns: Address of the constant
    /// - Description: Gets an address for a new Integer Cosntant
    func getConstInt() -> String{
        constInt = constInt + 1
        if constInt > 26600 {
            fatalError("Error, demasiadas constantes enteras declaradas")
        }
        return String(25000 + constInt)
    }
    
    /// getConstFloat
    /// - Returns: Address of the constant
    /// - Description: Gets an address for a new Float Constant
    func getConstFloat() -> String{
        constFloat = constFloat + 1
        if constFloat > 28300 {
            fatalError("Error, demasiadas constantes flotantes declaradas")
        }
        return String(26600 + constFloat)
    }
    
    /// getConstChar
    /// - Returns: Address of the Constant
    /// - Description: Gets an address for a new Char Constat
    func getConstChar() -> String{
        constChar = constChar + 1
        if constChar > 30000 {
            fatalError("Error, demasiadas constantes char declaradas")
        }
        return String(28300 + constChar)
    }
    
    /// getConstString
    /// - Returns: Address of the constant
    /// - Description: Gets an address for a new String Constant
    func getConstString() -> String{
        constString = constString + 1
        return String(30000 + constString)
    }
    
    /// getConst
    /// - Parameter type: Type of Constant
    /// - Returns: Address of the constant
    /// - Description: Gets an address for a new constant
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
    
    /// reset
    /// - Description: Resets the counters of local and temporal variables
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
