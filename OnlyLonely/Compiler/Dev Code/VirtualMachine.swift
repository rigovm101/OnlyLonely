//
//  VirtualMachine.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 5/25/21.
//

import Foundation

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
        
        for (value, info) in constTable{
            let address = info["virtualAddress"]!
            constMemory[address] = value
        }
        
    }
    
    public func run(){
        while quadruples[instructionPointer].operationCode != "armin" {
            let quad = quadruples[instructionPointer]
            
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
                    print("Error de dimensiones del arreglo")
                }
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
