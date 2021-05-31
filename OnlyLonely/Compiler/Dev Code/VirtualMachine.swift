//
//  VirtualMachine.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 5/25/21.
//

import Foundation

/// Virtual Machine
/// - Description: This class takes the Quadruples and runs the program
class VirtualMachine {
    
    var globalMemory : [String : String]
    var localMemory : [String : String]
    var temporalMemory : [String : String]
    var constMemory : [String : String]
    
    var instructionPointer : Int
    var functionTable : [String : [String : String]]
    var constTable : [String : [String : String]]
    var quadruples : [Quadruple]
    
    var instructionPointerStack : Stack<Int>
    var savedScopes : Stack<[String : [String : String]]>
    var localActivationRecord : [String : String]
    
    init() {
        globalMemory = [:]
        localMemory = [:]
        temporalMemory = [:]
        constMemory = [:]
        instructionPointer = 0
        functionTable = [:]
        constTable = [:]
        constMemory = [:]
        quadruples = []
        instructionPointerStack = Stack<Int>()
        savedScopes = Stack<[String : [String : String]]>()
        localActivationRecord = [:]
    }
    
    init(_ functionTable : [String : [String : String]], _ constTable : [String : [String : String]], _ quadruples : [Quadruple]){
        globalMemory = [:]
        localMemory = [:]
        temporalMemory = [:]
        constMemory = [:]
        instructionPointer = 0
        self.functionTable = functionTable
        self.constTable = constTable
        self.quadruples = quadruples
        instructionPointerStack = Stack<Int>()
        savedScopes = Stack<[String : [String : String]]>()
        localActivationRecord = [:]
        
        for (value, info) in constTable{
            let address = info["virtualAddress"]!
            constMemory[address] = value
        }
        
    }
    
    public func run(){
        while quadruples[instructionPointer].operationCode != "armin" {
            let uncheckedQuad = quadruples[instructionPointer]
            let quad = processQuad(uncheckedQuad)
            
            switch quad.operationCode {
            case "goto":
                instructionPointer = Int(quad.result)! - 1
            case "print":
                let address = quad.result
                print(accessMemory(address))
            case "gotof":
                let address = quad.leftOperand
                let result = accessMemory(String(address))
                if result == "false" {
                    let jump = Int(quad.result)! - 1
                    instructionPointer = jump
                }
            case "gosub":
                let funcName = quad.result
                let jumpDestination = Int(functionTable[funcName]!["startPosition"]!)!
                instructionPointerStack.push(instructionPointer)
                instructionPointer = jumpDestination - 1
                localMemory = localActivationRecord
                temporalMemory = [:]
                localActivationRecord = [:]
            case "era":
                let localContext = localMemory
                let tempContext = temporalMemory
                let currContext = ["localContext": localContext, "tempContext" : tempContext]
                savedScopes.push(currContext)
            case "parameter":
                let leftAddress = String(quad.leftOperand)
                let paramNumber = quad.rightOperand
                let funcName = quad.result
                let paramAddress = getAddressOfParam(paramNumber, funcName)
                let leftContent = accessMemory(leftAddress)
                localActivationRecord[paramAddress] = leftContent
            case "endfunc":
                let previousAddress = instructionPointerStack.pop()
                let previousContext = savedScopes.pop()!
                localMemory = previousContext["localContext"]!
                temporalMemory = previousContext["tempContext"]!
                instructionPointer = previousAddress!
            case "return":
                let leftAddress = String(quad.leftOperand)
                let leftContent = accessMemory(leftAddress)
                let funcName = quad.result
                let resultAddress = functionTable[funcName]!["globalVariableAddress"]!
                writeMemory(resultAddress, leftContent)
            case "=":
                let leftAddress = String(quad.leftOperand)
                let resultAddress = quad.result
                let content = accessMemory(leftAddress)
                writeMemory(resultAddress, content)
            case "+":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    let leftOperand = Int(accessMemory(leftAddress))!
                    let rightOperand = Int(accessMemory(rightAddress))!
                    let resultOperand = leftOperand + rightOperand
                    writeMemory(resultAddress, String(resultOperand))
                }else if type == "flotante"{
                    let leftOperand = Float(accessMemory(leftAddress))!
                    let rightOperand = Float(accessMemory(rightAddress))!
                    let resultOperand = leftOperand + rightOperand
                    writeMemory(resultAddress, String(resultOperand))
                }
            case "-":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    let leftOperand = Int(accessMemory(leftAddress))!
                    let rightOperand = Int(accessMemory(rightAddress))!
                    let resultOperand = leftOperand - rightOperand
                    writeMemory(resultAddress, String(resultOperand))
                }else if type == "flotante"{
                    let leftOperand = Float(accessMemory(leftAddress))!
                    let rightOperand = Float(accessMemory(rightAddress))!
                    let resultOperand = leftOperand - rightOperand
                    writeMemory(resultAddress, String(resultOperand))
                }
            case "*":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    let leftOperand = Int(accessMemory(leftAddress))!
                    let rightOperand = Int(accessMemory(rightAddress))!
                    let resultOperand = leftOperand * rightOperand
                    writeMemory(resultAddress, String(resultOperand))
                }else if type == "flotante"{
                    let leftOperand = Float(accessMemory(leftAddress))!
                    let rightOperand = Float(accessMemory(rightAddress))!
                    let resultOperand = leftOperand * rightOperand
                    writeMemory(resultAddress, String(resultOperand))
                }
            case "/":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    let leftOperand = Int(accessMemory(leftAddress))!
                    let rightOperand = Int(accessMemory(rightAddress))!
                    let resultOperand = leftOperand / rightOperand
                    writeMemory(resultAddress, String(resultOperand))
                }else if type == "flotante"{
                    let leftOperand = Float(accessMemory(leftAddress))!
                    let rightOperand = Float(accessMemory(rightAddress))!
                    let resultOperand = leftOperand / rightOperand
                    writeMemory(resultAddress, String(resultOperand))
                }
            case "<":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = Float(accessMemory(leftAddress))!
                let rightOperand = Float(accessMemory(rightAddress))!
                let resultOperand = leftOperand < rightOperand
                writeMemory(resultAddress, String(resultOperand))
            case ">":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = Float(accessMemory(leftAddress))!
                let rightOperand = Float(accessMemory(rightAddress))!
                let resultOperand = leftOperand > rightOperand
                writeMemory(resultAddress, String(resultOperand))
            case "==":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = Float(accessMemory(leftAddress))!
                let rightOperand = Float(accessMemory(rightAddress))!
                let resultOperand = leftOperand == rightOperand
                writeMemory(resultAddress, String(resultOperand))
            case "!=":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = Float(accessMemory(leftAddress))!
                let rightOperand = Float(accessMemory(rightAddress))!
                let resultOperand = leftOperand != rightOperand
                writeMemory(resultAddress, String(resultOperand))
            case "&":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = accessMemory(leftAddress)
                let rightOperand = accessMemory(rightAddress)
                
                if leftOperand == "true" && rightOperand == "true" {
                    let resultOperand = "true"
                    writeMemory(resultAddress, resultOperand)
                }else {
                    let resultOperand = "false"
                    writeMemory(resultAddress, resultOperand)
                }
            case "|":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = accessMemory(leftAddress)
                let rightOperand = accessMemory(rightAddress)
                
                if leftOperand == "true" || rightOperand == "true" {
                    let resultOperand = "true"
                    writeMemory(resultAddress, resultOperand)
                }else {
                    let resultOperand = "false"
                    writeMemory(resultAddress, resultOperand)
                }
            case "lee":
                let resultAddress = quad.result
                let value = readLine()
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    if let number = Int(value!){
                        writeMemory(resultAddress, String(number))
                    }
                }else if type == "flotante"{
                    if let number = Float(value!){
                        writeMemory(resultAddress, String(number))
                    }
                }
                
            case "verify":
                let address = String(quad.leftOperand)
                let upperLimit = Int(quad.result)!
                if Int(accessMemory(address))! >= upperLimit || Int(accessMemory(address))! < 0{
                    fatalError("Error de dimensiones del arreglo")
                }
                instructionPointer += 1
                let nextUnverifiedQuad = quadruples[instructionPointer]
                let nextQuad = processQuad(nextUnverifiedQuad)
                let leftAddress = nextQuad.leftOperand
                let leftContent = Int(accessMemory(leftAddress))!
                let displacement = Int(nextQuad.rightOperand)!
                let resultAddress = nextQuad.result
                let resultContent = leftContent + displacement
                writeMemory(resultAddress, String(resultContent))
            case "verifyMat":
                //Verify 1
                var address = String(quad.leftOperand)
                var upperLimit = Int(quad.result)!
                if Int(accessMemory(address))! >= upperLimit || Int(accessMemory(address))! < 0{
                    fatalError("Error de dimensiones del arreglo")
                }
                instructionPointer += 1
                //Verify 2
                var nextUnverifiedQuad = quadruples[instructionPointer]
                var nextQuad = processQuad(nextUnverifiedQuad)
                address = String(nextQuad.leftOperand)
                upperLimit = Int(nextQuad.result)!
                if Int(accessMemory(address))! >= upperLimit || Int(accessMemory(address))! < 0{
                    fatalError("Error de dimensiones del arreglo")
                }
                instructionPointer += 1
                //Multiplication
                nextUnverifiedQuad = quadruples[instructionPointer]
                nextQuad = processQuad(nextUnverifiedQuad)
                var leftOperand = Int(accessMemory(nextQuad.leftOperand))!
                var rightOperand = Int(nextQuad.rightOperand)!
                var result = leftOperand * rightOperand
                var resultAddress = nextQuad.result
                writeMemory(resultAddress, String(result))
                instructionPointer += 1
                //Sum 1
                nextUnverifiedQuad = quadruples[instructionPointer]
                nextQuad = processQuad(nextUnverifiedQuad)
                leftOperand = Int(accessMemory(nextQuad.leftOperand))!
                rightOperand = Int(accessMemory(nextQuad.rightOperand))!
                result = leftOperand + rightOperand
                resultAddress = nextQuad.result
                writeMemory(resultAddress, String(result))
                instructionPointer += 1
                //Sum 2
                nextUnverifiedQuad = quadruples[instructionPointer]
                nextQuad = processQuad(nextUnverifiedQuad)
                leftOperand = Int(accessMemory(nextQuad.leftOperand))!
                rightOperand = Int(nextQuad.rightOperand)!
                result = leftOperand + rightOperand
                resultAddress = nextQuad.result
                writeMemory(resultAddress, String(result))
            default:
                continue
            }
            
            instructionPointer += 1
        }
    }
    
    public func determineType(_ address : String) -> String {
        let numAddress = Int(address)!
        //Globales
        if numAddress <= 3300 {
            return "entero"
        }
        if numAddress <= 6600 {
            return "flotante"
        }
        if numAddress <= 10000 {
            return "char"
        }
        
        //Locales
        if numAddress <= 13300 {
            return "entero"
        }
        if numAddress <= 16600 {
            return "flotante"
        }
        if numAddress <= 20000 {
            return "char"
        }
        
        //Temporales
        if numAddress <= 21250 {
            return "entero"
        }
        if numAddress <= 22500 {
            return "flotante"
        }
        if numAddress <= 23750 {
            return "char"
        }
        if numAddress <= 25000{
            return "bool"
        }
        
        //Constantes
        if numAddress <= 26600 {
            return "entero"
        }
        if numAddress <= 28300 {
            return "flotante"
        }
        return "char"
    }
    
    public func determineScope(_ address : String) -> String{
        let numAddress = Int(address)!
        
        if numAddress < 10000{
            return "global"
        }else if numAddress < 20000{
            return "local"
        }else if numAddress < 25000{
            return "temporal"
        }else{
            return "constant"
        }
    }
    
    public func getAddressOfParam(_ paramNumberString : String, _ funcName : String) -> String{
        let paramNumber = Int(paramNumberString)!
        let paramSequence = functionTable[funcName]!["params"]!.split(separator: " ")
        let type = String(paramSequence[paramNumber])
        if type == "entero" {
            let pos = 10000 + paramNumber + 1
            return String(pos)
        }else if type == "flotante"{
            let pos = 13300 + paramNumber + 1
            return String(pos)
        }else {
            let pos = 16600 + paramNumber + 1
            return String(pos)
        }
    }
    
    public func processQuad(_ quad : Quadruple) -> Quadruple{
        var leftOperand = quad.leftOperand
        var rightOperand = quad.rightOperand
        var result = quad.result
        
        while leftOperand.contains("(") {
            leftOperand.removeFirst()
            leftOperand.removeLast()
            let actualAddress = accessMemory(leftOperand)
            leftOperand = actualAddress
        }
        while rightOperand.contains("("){
            rightOperand.removeFirst()
            rightOperand.removeLast()
            let actualAddress = accessMemory(rightOperand)
            rightOperand = actualAddress
        }
        while result.contains("(") {
            result.removeFirst()
            result.removeLast()
            let actualAddress = accessMemory(result)
            result = actualAddress
        }
        
        let revisedQuad = Quadruple(quad.operationCode, leftOperand, rightOperand, result)
        return revisedQuad
        
    }
    
    public func accessMemory(_ address : String) -> String{
        let numAddress = Int(address)!
        if numAddress < 10000{
            return globalMemory[address]!
        }
        
        if numAddress < 20000{
            return localMemory[address]!
        }
        
        if numAddress < 25000 {
            return temporalMemory[address]!
        }
        return constMemory[address]!
    }
    
    public func writeMemory(_ address : String, _ content : String){
        let numAddress = Int(address)!
        if numAddress < 10000{
            globalMemory[address] = content
        }else if numAddress < 20000{
            localMemory[address] = content
        }else if numAddress < 25000 {
            temporalMemory[address] = content
        }else{
            constMemory[address] = content
        }
    }
    
    public func printQuads(){
        while quadruples[instructionPointer].operationCode != "armin" {
            print("#\(instructionPointer)\t \(quadruples[instructionPointer].operationCode)\t\(quadruples[instructionPointer].leftOperand)\t\(quadruples[instructionPointer].rightOperand)\t\(quadruples[instructionPointer].result)")
            instructionPointer += 1
        }
        instructionPointer = 0
    }
}
