//
//  VirtualMachine.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 5/25/21.
//

import Foundation

class VirtualMachine {
    
    var memory : [String : String]
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
        
        
        for (value, info) in constTable{
            let address = info["virtualAddress"]!
            memory[address] = value
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
                print(memory[address]!)
            case "gotof":
                let address = quad.leftOperand
                let result = memory[String(address)]
                if result == "false" {
                    let jump = Int(quad.result)! - 1
                    instructionPointer = jump
                }
            case "=":
                let leftAddress = String(quad.leftOperand)
                let resultAddress = quad.result
                memory[resultAddress] = memory[leftAddress]
            case "+":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    let leftOperand = Int(memory[leftAddress]!)!
                    let rightOperand = Int(memory[rightAddress]!)!
                    let resultOperand = leftOperand + rightOperand
                    memory[resultAddress] = String(resultOperand)
                }else if type == "flotante"{
                    let leftOperand = Float(memory[leftAddress]!)!
                    let rightOperand = Float(memory[rightAddress]!)!
                    let resultOperand = leftOperand + rightOperand
                    memory[resultAddress] = String(resultOperand)
                }
            case "-":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    let leftOperand = Int(memory[leftAddress]!)!
                    let rightOperand = Int(memory[rightAddress]!)!
                    let resultOperand = leftOperand - rightOperand
                    memory[resultAddress] = String(resultOperand)
                }else if type == "flotante"{
                    let leftOperand = Float(memory[leftAddress]!)!
                    let rightOperand = Float(memory[rightAddress]!)!
                    let resultOperand = leftOperand - rightOperand
                    memory[resultAddress] = String(resultOperand)
                }
            case "*":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    let leftOperand = Int(memory[leftAddress]!)!
                    let rightOperand = Int(memory[rightAddress]!)!
                    let resultOperand = leftOperand * rightOperand
                    memory[resultAddress] = String(resultOperand)
                }else if type == "flotante"{
                    let leftOperand = Float(memory[leftAddress]!)!
                    let rightOperand = Float(memory[rightAddress]!)!
                    let resultOperand = leftOperand * rightOperand
                    memory[resultAddress] = String(resultOperand)
                }
            case "/":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    let leftOperand = Int(memory[leftAddress]!)!
                    let rightOperand = Int(memory[rightAddress]!)!
                    let resultOperand = leftOperand / rightOperand
                    memory[resultAddress] = String(resultOperand)
                }else if type == "flotante"{
                    let leftOperand = Float(memory[leftAddress]!)!
                    let rightOperand = Float(memory[rightAddress]!)!
                    let resultOperand = leftOperand / rightOperand
                    memory[resultAddress] = String(resultOperand)
                }
            case "<":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = Float(memory[leftAddress]!)!
                let rightOperand = Float(memory[rightAddress]!)!
                let resultOperand = leftOperand < rightOperand
                memory[resultAddress] = String(resultOperand)
            case ">":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = Float(memory[leftAddress]!)!
                let rightOperand = Float(memory[rightAddress]!)!
                let resultOperand = leftOperand > rightOperand
                memory[resultAddress] = String(resultOperand)
            case "==":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = Float(memory[leftAddress]!)!
                let rightOperand = Float(memory[rightAddress]!)!
                let resultOperand = leftOperand == rightOperand
                memory[resultAddress] = String(resultOperand)
            case "!=":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = Float(memory[leftAddress]!)!
                let rightOperand = Float(memory[rightAddress]!)!
                let resultOperand = leftOperand != rightOperand
                memory[resultAddress] = String(resultOperand)
            case "&":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = String(memory[leftAddress]!)
                let rightOperand = String(memory[rightAddress]!)
                
                if leftOperand == "true" && rightOperand == "true" {
                    let resultOperand = "true"
                    memory[resultAddress] = resultOperand
                }else {
                    let resultOperand = "false"
                    memory[resultAddress] = resultOperand
                }
            case "|":
                let leftAddress = String(quad.leftOperand)
                let rightAddress = String(quad.rightOperand)
                let resultAddress = quad.result
                
                let leftOperand = String(memory[leftAddress]!)
                let rightOperand = String(memory[rightAddress]!)
                
                if leftOperand == "true" || rightOperand == "true" {
                    let resultOperand = "true"
                    memory[resultAddress] = resultOperand
                }else {
                    let resultOperand = "false"
                    memory[resultAddress] = resultOperand
                }
            case "lee":
                let resultAddress = quad.result
                let value = readLine()
                let type = determineType(resultAddress)
                
                if type == "entero" {
                    if let number = Int(value!){
                        memory[resultAddress] = String(number)
                    }
                }else if type == "flotante"{
                    if let number = Float(value!){
                        memory[resultAddress] = String(number)
                    }
                }
                
            case "verify":
                let address = String(quad.leftOperand)
                let upperLimit = Int(quad.result)!
                if Int(memory[address]!)! >= upperLimit || Int(memory[address]!)! < 0{
                    print("Error de dimensiones del arreglo")
                }
                instructionPointer += 1
                let nextQuad = quadruples[instructionPointer]
                let leftAddress = String(nextQuad.leftOperand)
                let rightAddress = nextQuad.rightOperand
                let resultAddress = nextQuad.result
                let result = rightAddress + Int(memory[leftAddress]!)!
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
    
    public func printQuads(){
        while quadruples[instructionPointer].operationCode != "armin" {
            print("#\(instructionPointer)\t \(quadruples[instructionPointer].operationCode)\t\(quadruples[instructionPointer].leftOperand)\t\(quadruples[instructionPointer].rightOperand)\t\(quadruples[instructionPointer].result)")
            instructionPointer += 1
        }
        instructionPointer = 0
    }
}
