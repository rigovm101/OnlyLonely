//
//  MyCustomListener.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 23/04/21.
//

import Foundation
import Antlr4

open class MyCustomListener : OnlyLonelyListener {
    
    var functionTable : [String: [String : String]]
    var variableTable : [String: [String : String]]
    let semanticCube : SemanticCube
    var quadruples : [Quadruple]
    var operandStack : Stack<String>
    var typeStack : Stack<String>
    var operatorStack : Stack<String>
    var jumpStack : Stack<Int>
    let myTempVarGenerator : TemporalVariableGenerator
    var currFuncName : String
    var localVariableTable : [String : [String : String]]
    var localVariableCounter : Int
    var currParam : Int
    var constTable : [String : [String : String]]
    
    init() {
        functionTable = [:]
        variableTable = [:]
        semanticCube = SemanticCube()
        quadruples = []
        operandStack = Stack<String>()
        typeStack = Stack<String>()
        operatorStack = Stack<String>()
        myTempVarGenerator = TemporalVariableGenerator()
        jumpStack = Stack<Int>()
        currFuncName = String()
        localVariableTable = [:]
        localVariableCounter = 0
        currParam = 0
        constTable = [:]
        constTable["1"] = [:]
        constTable["1"]!["tipo"] = "entero"
        constTable["1"]!["virtualAddress"] = String(myTempVarGenerator.getConst("entero"))
    }
    
    public func getFunctionTable() -> [String: [String : String]]{
        return functionTable
    }
    
    public func getConstTable() -> [String: [String : String]]{
        return constTable
    }
    
    public func getQuadruples() -> [Quadruple]{
        return quadruples
    }
    
    public func enterRoot(_ ctx: OnlyLonelyParser.RootContext) {
        jumpStack.push(quadruples.count)
        quadruples.append(Quadruple("goto", "-1", "-1", "-1"))
    }
    
    public func exitRoot(_ ctx: OnlyLonelyParser.RootContext) {
        quadruples.append(Quadruple("armin", "-1", "-1", "-1"))
//        print("Diccionario de Funciones")
//        print(functionTable)
//        print("Diccionario de Variables Globales")
//        print(variableTable)
//        print("Diccionario de Variables")
//        print(localVariableTable)
//        print("Tabla de Constantes")
//        print(constTable)
//        print("Pila de Operandos")
//        while (operandStack.top() != nil) {
//            print(operandStack.pop()!)
//        }
//        print("Pila de Tipos")
//        while (typeStack.top() != nil) {
//            print(typeStack.pop()!)
//        }
//        print("Pila de Operadores")
//        while (operatorStack.top() != nil) {
//            print(operatorStack.pop()!)
//        }
//        print("Pila de Saltos")
//        while (jumpStack.top() != nil) {
//            print(jumpStack.pop()!)
//        }
//        print("Cuadruplos")
//        for quad in quadruples{
//            print("\(quad.operationCode)\t\(quad.leftOperand)\t\(quad.rightOperand)\t\(quad.result)")
//        }
    }
    
    public func enterDecVar(_ ctx: OnlyLonelyParser.DecVarContext) {
        
    }
    
    public func exitDecVar(_ ctx: OnlyLonelyParser.DecVarContext) {
        if ctx.getText() != "" {
            let values = ctx.listaVTipo()?.getText()
            let types = (values?.split(separator: ";"))!
            for type in types {
                let tType = type.split(separator: ":")
                let ids = tType[0].split(separator: ",")
                for id in ids {
                    if id.contains("[") {
                        let temp = id.split(separator: "[")
                        let trueId = temp[0]
                        if variableTable[String(trueId)]!["esArreglo"] == "true"{
                            variableTable[String(trueId)]!["tipo"] = String(tType[1])
                            variableTable[String(trueId)]!["virtualAddress"] = String(myTempVarGenerator.getGlobalArray(String(tType[1]), variableTable[String(trueId)]!["size"]!))
                        }else{
                            print("Error, variable \(id) ya ha sido declarada en este contexto")
                        }
                    }else{
                        if variableTable[String(id)] == nil{
                            variableTable[String(id)] = [:]
                            variableTable[String(id)]!["tipo"] = String(tType[1])
                            variableTable[String(id)]!["virtualAddress"] = String(myTempVarGenerator.getGlobalVar(String(tType[1])))
                        }else{
                            print("Error, variable \(id) ya ha sido declarada en este contexto")
                        }
                    }
                }
            }
        }
    }
    
    public func enterListaVTipo(_ ctx: OnlyLonelyParser.ListaVTipoContext) {
        
    }
    
    public func exitListaVTipo(_ ctx: OnlyLonelyParser.ListaVTipoContext) {
        
    }
    
    public func enterDecVarLocal(_ ctx: OnlyLonelyParser.DecVarLocalContext) {
    }
    
    public func exitDecVarLocal(_ ctx: OnlyLonelyParser.DecVarLocalContext) {
        let values = ctx.listaVTipo()?.getText()
        var amountInt = 0
        var amountFloat = 0
        var amountChar = 0
        if values != nil {
            let types = (values?.split(separator: ";"))!
            for type in types {
                let tType = type.split(separator: ":")
                let ids = tType[0].split(separator: ",")
                for id in ids {
                    if id.contains("["){
                        let temp = id.split(separator: "[")
                        let trueId = temp[0]
                        if localVariableTable[String(trueId)]!["esArreglo"] == "true"{
                            let stringType = String(tType[1])
                            localVariableTable[String(trueId)]!["tipo"] = stringType
                            localVariableTable[String(trueId)]!["virtualAddress"] = String(myTempVarGenerator.getLocalArray(stringType, localVariableTable[String(trueId)]!["size"]!))
                            localVariableCounter += Int(localVariableTable[String(trueId)]!["size"]!)!
                            if stringType == "entero" {
                                amountInt += Int(localVariableTable[String(trueId)]!["size"]!)!
                            }else if stringType == "flotante"{
                                amountFloat += Int(localVariableTable[String(trueId)]!["size"]!)!
                            }else if stringType == "char"{
                                amountChar += Int(localVariableTable[String(trueId)]!["size"]!)!
                            }
                        }else{
                            print("Error, variable \(id) no es un arreglo")
                        }
                    }else{
                        if localVariableTable[String(id)] == nil{
                            let stringType = String(tType[1])
                            localVariableTable[String(id)] = [:]
                            localVariableTable[String(id)]!["tipo"] = stringType
                            localVariableTable[String(id)]!["virtualAddress"] = String(myTempVarGenerator.getLocalVar(stringType))
                            localVariableCounter += 1
                            if stringType == "entero" {
                                amountInt += 1
                            }else if stringType == "flotante"{
                                amountFloat += 1
                            }else if stringType == "char"{
                                amountChar += 1
                            }
                        }else{
                            print("Error, variable \(id) ya ha sido declarada en este contexto")
                        }
                    }
                }
            }
            functionTable[currFuncName]!["size"] = "\(amountInt) entero, \(amountFloat) flotante, \(amountChar) char"
        }
    }
    
    public func saveFuncStartingPoint(){
        functionTable[currFuncName]!["startPosition"] = String(quadruples.count)
        functionTable[currFuncName]!["numLocalVars"] = String(localVariableCounter)
    }
    
    public func enterListaIds(_ ctx: OnlyLonelyParser.ListaIdsContext) {
        
    }
    
    public func exitListaIds(_ ctx: OnlyLonelyParser.ListaIdsContext) {
        
    }
    
    public func enterVariable(_ ctx: OnlyLonelyParser.VariableContext) {
        
    }
    
    public func exitVariable(_ ctx: OnlyLonelyParser.VariableContext) {
        
    }
    
    public func enterDecFunc(_ ctx: OnlyLonelyParser.DecFuncContext) {
        
    }
    
    public func exitDecFunc(_ ctx: OnlyLonelyParser.DecFuncContext) {
        
    }
    
    public func saveFunctionName(_ id: String, _ returnType: String){
        functionTable[id] = ["tRetorno": returnType]
        functionTable[id]!["params"] = ""
        functionTable[id]!["numParams"] = "0"
        currFuncName = id
        
        if returnType != "void" {
            variableTable[id] = [:]
            variableTable[id]!["tipo"] = returnType
            let address = myTempVarGenerator.getGlobalVar(returnType)
            variableTable[id]!["virtualAddress"] = address
            functionTable[id]!["globalVariableAddress"] = address
        }
    }
    
    public func checkIfReturn(){
        if functionTable[currFuncName]!["tRetorno"] != "void" {
            if functionTable[currFuncName]!["hasReturnStatement"] != "true"{
                print("Error, la función \(currFuncName) no tiene un estatuto de retorno")
            }
        }
    }
    
    public func enterTFuncion(_ ctx: OnlyLonelyParser.TFuncionContext) {
        
    }
    
    public func exitTFuncion(_ ctx: OnlyLonelyParser.TFuncionContext) {
        localVariableCounter = 0
        localVariableTable = [:]
        functionTable[currFuncName]!["temporalesUsados"] = String(myTempVarGenerator.counter)
        quadruples.append(Quadruple("endfunc", "-1", "-1", "-1"))
        myTempVarGenerator.reset()
        currFuncName = ""
    }
    
    public func enterCuerpo(_ ctx: OnlyLonelyParser.CuerpoContext) {
        
    }
    
    public func exitCuerpo(_ ctx: OnlyLonelyParser.CuerpoContext) {
        
    }
    
    public func saveParameter(_ id: String, _ type: String) {
        if localVariableTable[id] == nil{
            var paramSequence = functionTable[currFuncName]!["params"]
            var numParams = Int(functionTable[currFuncName]!["numParams"]!)
            localVariableTable[id] = [:]
            localVariableTable[id]!["tipo"] = type
            localVariableTable[id]!["virtualAddress"] = myTempVarGenerator.getLocalVar(type)
            paramSequence?.append("\(type) ")
            functionTable[currFuncName]!["params"] = paramSequence
            numParams = numParams! + 1
            localVariableCounter += 1
            functionTable[currFuncName]!["numParams"] = String(numParams!)
        }else{
            print("Error, parametro \(id) ya existe")
        }
    }
    
    public func enterParametros(_ ctx: OnlyLonelyParser.ParametrosContext) {
        
    }
    
    public func exitParametros(_ ctx: OnlyLonelyParser.ParametrosContext) {
        
    }
    
    public func enterTPrincipal(_ ctx: OnlyLonelyParser.TPrincipalContext) {
        let position = jumpStack.pop()
        quadruples[position!].setResult(String(quadruples.count))
    }
    
    public func exitTPrincipal(_ ctx: OnlyLonelyParser.TPrincipalContext) {
        
    }
    
    public func enterTipoRet(_ ctx: OnlyLonelyParser.TipoRetContext) {
        
    }
    
    public func exitTipoRet(_ ctx: OnlyLonelyParser.TipoRetContext) {
        
    }
    
    public func enterTipo(_ ctx: OnlyLonelyParser.TipoContext) {
        
    }
    
    public func exitTipo(_ ctx: OnlyLonelyParser.TipoContext) {
        
    }
    
    public func enterEstatuto(_ ctx: OnlyLonelyParser.EstatutoContext) {
        
    }
    
    public func exitEstatuto(_ ctx: OnlyLonelyParser.EstatutoContext) {
        
    }
    
    public func enterTAsignacion(_ ctx: OnlyLonelyParser.TAsignacionContext) {
        
    }
    
    public func createArray(_ number : String, _ id : String) {
        if currFuncName != "" {
            if localVariableTable[id] == nil{
                localVariableTable[id] = [:]
                localVariableTable[id]!["esArreglo"] = "true"
                localVariableTable[id]!["size"] = number
                localVariableCounter += Int(number)! - 1
            }else{
                print("Error, variable \(id) ya ha sido declarada en este contexto")
            }
        }else {
            if variableTable[id] == nil{
                variableTable[id] = [:]
                variableTable[id]!["esArreglo"] = "true"
                variableTable[id]!["size"] = number
            }else{
                print("Error, variable \(id) ya ha sido declarada en este contexto")
            }
        }
    }
    
    public func exitTAsignacion(_ ctx: OnlyLonelyParser.TAsignacionContext) {
        let id = ctx.Id()?.description
        if variableTable[id!]?["esArreglo"] == nil && localVariableTable[id!]?["esArreglo"] == nil {
            if let type = localVariableTable[id!]?["tipo"]{
                if let resultType = semanticCube.chekCube(leftType: type, rightType: typeStack.top()!, myOperator: "=") {
                    let virtualAddress = localVariableTable[id!]!["virtualAddress"]
                    quadruples.append(Quadruple("=", operandStack.pop()!, "-1", virtualAddress!))
                    localVariableTable[id!]!["tipo"] = resultType
                    typeStack.simplePop()
                }else{
                    print("Error, tipos \(type) y \(typeStack.pop()!) no son compatibles")
                }
            }else if let type = variableTable[id!]!["tipo"]{
                if let resultType = semanticCube.chekCube(leftType: type, rightType: typeStack.top()!, myOperator: "=") {
                    let virtualAddress = variableTable[id!]!["virtualAddress"]
                    quadruples.append(Quadruple("=", operandStack.pop()!, "-1", virtualAddress!))
                    variableTable[id!]!["tipo"] = resultType
                    typeStack.simplePop()
                }else{
                    print("Error, tipos \(type) y \(typeStack.pop()!) no son compatibles")
                }
            } else{
                print("Error, la variable \(id!) no ha sido declarada en este contexto")
            }
        }else{
            if let type = localVariableTable[id!]?["tipo"]{
                if let resultType = semanticCube.chekCube(leftType: type, rightType: typeStack.top()!, myOperator: "=") {
                    quadruples.append(Quadruple("=", operandStack.pop()!, "-1", operandStack.pop()!))
                    localVariableTable[id!]!["tipo"] = resultType
                    typeStack.simplePop()
                    typeStack.simplePop()
                }else{
                    print("Error, tipos \(type) y \(typeStack.pop()!) no son compatibles")
                }
            }else if let type = variableTable[id!]!["tipo"]{
                if let resultType = semanticCube.chekCube(leftType: type, rightType: typeStack.top()!, myOperator: "=") {
                    quadruples.append(Quadruple("=", operandStack.pop()!, "-1", operandStack.pop()!))
                    variableTable[id!]!["tipo"] = resultType
                    typeStack.simplePop()
                    typeStack.simplePop()
                }else{
                    print("Error, tipos \(type) y \(typeStack.pop()!) no son compatibles")
                }
            } else{
                print("Error, la variable \(id!) no ha sido declarada en este contexto")
            }
        }
    }
    
    public func checkIsNotArray(_ id : String){
        if localVariableTable[id]?["esArreglo"] != nil {
            print("Error, la variable \(id) es un arreglo")
        }else if variableTable[id]?["esArreglo"] != nil{
            print("Error, la variable \(id) es un arreglo")
        }
    }
    
    public func enterLlamadaVoid(_ ctx: OnlyLonelyParser.LlamadaVoidContext) {
        
    }
    
    public func verifyFuncExists(_ funcName : String){
        if functionTable[funcName] == nil{
            print("Error, la funcion \(funcName) no existe")
        }
    }
    
    public func verifyNoVoidFuncExists(_ funcName : String){
        if functionTable[funcName] == nil{
            print("Error, la funcion \(funcName) no existe")
        }
    }
    
    public func generateEra(_ funcName : String){
        quadruples.append(Quadruple("era", "-1", "-1", funcName))
        currFuncName = funcName
    }
    
    public func processArgument(){
        let argument = operandStack.pop()
        let argumentType = typeStack.pop()
        if currFuncName != "" {
            let list = functionTable[currFuncName]!["params"]?.split(separator: " ")
            if list!.count == 0{
                print("Error, esta funcion no tiene parámetros")
            }else{
                if String(list![currParam]) == argumentType{
                    quadruples.append(Quadruple("parameter", argument!, String(currParam), currFuncName))
                    currParam = currParam + 1
                }else{
                    print("Error, el arumento es de tipo incorrecto")
                }
            }
        }else{
            
        }
    }
    
    public func exitLlamadaVoid(_ ctx: OnlyLonelyParser.LlamadaVoidContext) {
        if currParam == Int(functionTable[currFuncName]!["numParams"]!) {
            quadruples.append(Quadruple("gosub", "-1", "-1", currFuncName))
            currParam = 0
        }else{
            print("Error, no se pasaron los argumentos necesarios para la función")
        }
    }
    
    public func enterLlamada(_ ctx: OnlyLonelyParser.LlamadaContext) {
        operatorStack.push("(")
    }
    
    public func exitLlamada(_ ctx: OnlyLonelyParser.LlamadaContext) {
        if currParam == Int(functionTable[currFuncName]!["numParams"]!) {
            quadruples.append(Quadruple("gosub", "-1", "-1", currFuncName))
            let returnType = functionTable[currFuncName]!["tRetorno"]!
            let tempVar = myTempVarGenerator.getTempVar(returnType)
            let virtualAddress = variableTable[currFuncName]!["virtualAddress"]
            quadruples.append(Quadruple("=", virtualAddress!, "-1", String(tempVar)))
            operandStack.push(tempVar)
            typeStack.push(returnType)
            currParam = 0
            operatorStack.simplePop()
        }else{
            print("Error, no se pasaron los argumentos necesarios para la función")
        }
    }
    
    public func enterArgumentos(_ ctx: OnlyLonelyParser.ArgumentosContext) {
        
    }
    
    public func exitArgumentos(_ ctx: OnlyLonelyParser.ArgumentosContext) {
        
    }
    
    public func enterRetornoFunc(_ ctx: OnlyLonelyParser.RetornoFuncContext) {
        
    }
    
    public func exitRetornoFunc(_ ctx: OnlyLonelyParser.RetornoFuncContext) {
        let operand = operandStack.pop()!
        let operandType = typeStack.pop()!
        if functionTable[currFuncName]!["tRetorno"] != operandType {
            print("Error, \(String(describing: operand)) es de tipo \(String(describing: operandType)), y debe de ser \(functionTable[currFuncName]!["tRetorno"]!)")
        }else{
            functionTable[currFuncName]!["hasReturnStatement"] = "true"
            quadruples.append(Quadruple("return", operand, "-1", currFuncName))
        }
    }
    
    public func enterLectura(_ ctx: OnlyLonelyParser.LecturaContext) {
        
    }
    
    public func exitLectura(_ ctx: OnlyLonelyParser.LecturaContext) {
        let text = ctx.argumentos()?.getText()
        let ids = text?.split(separator: ",")
        for id in ids! {
            if (localVariableTable[String(id)] != nil) {
                let virtualAddress = localVariableTable[String(id)]!["virtualAddress"]
                quadruples.append(Quadruple("lee", "-1", "-1", virtualAddress!))
            }else if (variableTable[String(id)] != nil) {
                let virtualAddress = variableTable[String(id)]!["virtualAddress"]
                quadruples.append(Quadruple("lee", "-1", "-1", virtualAddress!))
            }else{
                print("Error, la variable \(id) no se ha declarado")
            }
        }
    }
    
    public func enterEscritura(_ ctx: OnlyLonelyParser.EscrituraContext) {
        
    }
    
    public func exitEscritura(_ ctx: OnlyLonelyParser.EscrituraContext) {
        
    }
    
    public func enterEscrituraAux(_ ctx: OnlyLonelyParser.EscrituraAuxContext) {
        
    }
    
    public func processPrint(_ text : String){
        if text != "" {
            if constTable[text] != nil {
                let virtualAddress = constTable[text]!["virtualAddress"]
                quadruples.append(Quadruple("print", "-1", "-1", virtualAddress!))
            }else{
                let virtualAddress = myTempVarGenerator.getConstString()
                constTable[text] = [:]
                constTable[text]!["virtualAddress"] = virtualAddress
                constTable[text]!["type"] = "string"
                quadruples.append(Quadruple("print", "-1", "-1", virtualAddress))
            }
        }else{
            let operand = operandStack.pop()
            typeStack.simplePop()
            if operand != nil {
                quadruples.append(Quadruple("print", "-1", "-1", operand!))
            }
        }
    }
    
    public func exitEscrituraAux(_ ctx: OnlyLonelyParser.EscrituraAuxContext) {
        
    }
    
    public func saveJumpPoint(){
        if typeStack.pop() == "bool" {
            quadruples.append(Quadruple("gotof", operandStack.pop()!, "-1", "-1"))
            jumpStack.push(quadruples.count-1)
        }else{
            print("Error, se espera una expresión de tipo bool")
        }
    }
    
    public func writeElseSavePoint(){
        if let position = jumpStack.pop(){
            quadruples[position].setResult(String(quadruples.count+1))
        }
        quadruples.append(Quadruple("goto", "-1", "-1", "-1"))
        jumpStack.push(quadruples.count-1)
    }
    
    public func writeSavePoint(){
        if let position = jumpStack.pop(){
            quadruples[position].setResult(String(quadruples.count))
        }
    }
    
    public func enterEstDesicion(_ ctx: OnlyLonelyParser.EstDesicionContext) {
        
    }
    
    public func exitEstDesicion(_ ctx: OnlyLonelyParser.EstDesicionContext) {
        
    }
    
    public func enterTSino(_ ctx: OnlyLonelyParser.TSinoContext) {
        
    }
    
    public func exitTSino(_ ctx: OnlyLonelyParser.TSinoContext) {
        
    }
    
    public func saveWhileCondStart(){
        jumpStack.push(quadruples.count)
    }
    
    public func saveWhileBodyStart(){
        if typeStack.pop() == "bool" {
            quadruples.append(Quadruple("gotof", operandStack.pop()!, "-1", "-1"))
            jumpStack.push(quadruples.count-1)
        }else{
            print("Error, se esperaba un tipo bool")
        }
    }
    
    public func saveWhileBodyEnd(){
        let end = jumpStack.pop()
        let begining = jumpStack.pop()
        quadruples.append(Quadruple("goto", "-1", "-1", String(begining!)))
        quadruples[end!].setResult(String(quadruples.count))
    }
    
    public func enterTMientras(_ ctx: OnlyLonelyParser.TMientrasContext) {
        
    }
    
    public func exitTMientras(_ ctx: OnlyLonelyParser.TMientrasContext) {
        
    }
    
    public func varDeclarationForLoop(_ id: String){
        if typeStack.pop() == "entero" {
            let virtualAddress = myTempVarGenerator.getTempInt()
            localVariableTable[id] = [:]
            localVariableTable[id]!["tipo"] = "entero"
            localVariableTable[id]!["virtualAddress"] = virtualAddress
            quadruples.append(Quadruple("=", operandStack.pop()!, "-1", virtualAddress))
            operandStack.push(virtualAddress)
            typeStack.push("entero")
        }
    }
    
    public func conditionForLoop(){
        if typeStack.pop() == "entero" {
            jumpStack.push(quadruples.count+1)
            let right = operandStack.pop()
            let left = operandStack.pop()
            let temp = myTempVarGenerator.getTempBool()
            quadruples.append(Quadruple("<", left!, right!, String(temp)))
            jumpStack.push(quadruples.count-1)
            typeStack.simplePop()
            quadruples.append(Quadruple("gotof", temp, "-1", "-1"))
            operandStack.push(left!)
            typeStack.push("entero")
        }
    }
    
    public func endForLoop(_ id : String){
        let address = operandStack.pop()
        typeStack.simplePop()
        let oneAddress = constTable["1"]!["virtualAddress"]
        quadruples.append(Quadruple("+", address!, oneAddress!, address!))
        let begin = jumpStack.pop()
        quadruples.append(Quadruple("goto", "-1", "-1", String(begin!)))
        let trail = jumpStack.pop()
        quadruples[trail!].setResult(String(quadruples.count))
        localVariableTable[id] = nil
    }
    
    public func enterTDesde(_ ctx: OnlyLonelyParser.TDesdeContext) {
        
    }
    
    public func exitTDesde(_ ctx: OnlyLonelyParser.TDesdeContext) {
        
    }
    
    public func enterExp(_ ctx: OnlyLonelyParser.ExpContext) {
        
    }
    
    public func exitExp(_ ctx: OnlyLonelyParser.ExpContext) {
        
    }
    
    public func foundMultiplicacion(){
        operatorStack.push("*")
    }
    
    public func foundDivision(){
        operatorStack.push("/")
    }
    
    public func foundSuma(){
        operatorStack.push("+")
    }
    
    public func foundResta(){
        operatorStack.push("-")
    }
    
    public func foundAbreParentesis(){
        operatorStack.push("(")
    }
    
    public func foundMenorQue(){
        operatorStack.push("<")
    }
    
    public func foundMayorQue(){
        operatorStack.push(">")
    }
    
    public func foundIgualQue(){
        operatorStack.push("==")
    }
    
    public func foundDiferenteQue(){
        operatorStack.push("!=")
    }
    
    public func foundTokenOr(){
        operatorStack.push("|")
    }
    
    public func foundTokenAnd(){
        operatorStack.push("&")
    }
    
    public func foundCierraParentesis(){
        if operatorStack.top() == "(" {
            operatorStack.simplePop()
        }else{
            print("Error, no se esperaba )")
        }
    }
    
    public func enterExpRel(_ ctx: OnlyLonelyParser.ExpRelContext) {
        
    }
    
    public func exitExpRel(_ ctx: OnlyLonelyParser.ExpRelContext) {
        if (operatorStack.top() == "|" || operatorStack.top() == "&"){
            let rightOperand = operandStack.pop()!
            let rightType = typeStack.pop()!
            let leftOperand = operandStack.pop()!
            let leftType = typeStack.pop()!
            let myOperator = operatorStack.pop()!
            if semanticCube.chekCube(leftType: leftType, rightType: rightType, myOperator: myOperator) != nil{
                let resultType = semanticCube.chekCube(leftType: leftType, rightType: rightType, myOperator: myOperator)
                let myTempVar = myTempVarGenerator.getTempVar(resultType!)
                quadruples.append(Quadruple(myOperator, leftOperand, rightOperand, String(myTempVar)))
                operandStack.push(myTempVar)
                typeStack.push(resultType!)
            }else{
                print("Error, tipos \(leftType) y \(rightType) no son compatibles")
            }
        }
    }
    
    public func enterExpArit(_ ctx: OnlyLonelyParser.ExpAritContext) {
        
    }
    
    public func exitExpArit(_ ctx: OnlyLonelyParser.ExpAritContext) {
        if (operatorStack.top() == "<" || operatorStack.top() == ">" || operatorStack.top() == "==" || operatorStack.top() == "!="){
            let rightOperand = operandStack.pop()!
            let rightType = typeStack.pop()!
            let leftOperand = operandStack.pop()!
            let leftType = typeStack.pop()!
            let myOperator = operatorStack.pop()!
            if semanticCube.chekCube(leftType: leftType, rightType: rightType, myOperator: myOperator) != nil{
                let resultType = semanticCube.chekCube(leftType: leftType, rightType: rightType, myOperator: myOperator)
                let myTempVar = myTempVarGenerator.getTempVar(resultType!)
                quadruples.append(Quadruple(myOperator, leftOperand, rightOperand, String(myTempVar)))
                operandStack.push(myTempVar)
                typeStack.push(resultType!)
            }else{
                print("Error, tipos \(leftType) y \(rightType) no son compatibles")
            }
        }
    }
    
    public func enterTermino(_ ctx: OnlyLonelyParser.TerminoContext) {
        
    }
    
    public func exitTermino(_ ctx: OnlyLonelyParser.TerminoContext) {
        if (operatorStack.top() == "+" || operatorStack.top() == "-"){
            let rightOperand = operandStack.pop()!
            let rightType = typeStack.pop()!
            let leftOperand = operandStack.pop()!
            let leftType = typeStack.pop()!
            let myOperator = operatorStack.pop()!
            if semanticCube.chekCube(leftType: leftType, rightType: rightType, myOperator: myOperator) != nil{
                let resultType = semanticCube.chekCube(leftType: leftType, rightType: rightType, myOperator: myOperator)
                let myTempVar = myTempVarGenerator.getTempVar(resultType!)
                quadruples.append(Quadruple(myOperator, leftOperand, rightOperand, String(myTempVar)))
                operandStack.push(myTempVar)
                typeStack.push(resultType!)
            }else{
                print("Error, tipos \(leftType) y \(rightType) no son compatibles")
            }
        }
    }
    
    public func enterFactor(_ ctx: OnlyLonelyParser.FactorContext) {
        
    }
    
    public func exitFactor(_ ctx: OnlyLonelyParser.FactorContext) {
        if ctx.llamada()?.getText() == nil {
            if let id = ctx.Id()?.getText() {
                if ctx.AbreCorchete()?.getText() == nil {
                    if variableTable[id] != nil{
                        let type = variableTable[id]?["tipo"]
                        let virtualAddress = variableTable[id]!["virtualAddress"]
                        operandStack.push(virtualAddress!)
                        typeStack.push(type!)
                    }else if localVariableTable[id] != nil{
                        let type = localVariableTable[id]?["tipo"]
                        let virtualAddress = localVariableTable[id]!["virtualAddress"]
                        operandStack.push(virtualAddress!)
                        typeStack.push(type!)
                    }else{
                        print("Error, la variable \(id) no ha sido declarada")
                    }
                }
            }else{
                if (ctx.Numero() != nil) {
                    let num = ctx.Numero()?.getText()
                    if constTable[num!] != nil {
                        let virtualAddress = constTable[num!]!["virtualAddress"]
                        operandStack.push(virtualAddress!)
                        typeStack.push("entero")
                    }else{
                        let virtualAddress = myTempVarGenerator.getConst("entero")
                        constTable[num!] = [:]
                        constTable[num!]!["tipo"] = "entero"
                        constTable[num!]!["virtualAddress"] = virtualAddress
                        operandStack.push(virtualAddress)
                        typeStack.push("entero")
                    }
                    
                }else if (ctx.NumFlotante() != nil){
                    let num = ctx.NumFlotante()?.getText()
                    if constTable[num!] != nil {
                        let virtualAddress = constTable[num!]!["virtualAddress"]
                        operandStack.push(virtualAddress!)
                        typeStack.push("flotante")
                    }else{
                        let virtualAddress = myTempVarGenerator.getConst("flotante")
                        constTable[num!] = [:]
                        constTable[num!]!["tipo"] = "flotante"
                        constTable[num!]!["virtualAddress"] = virtualAddress
                        operandStack.push(virtualAddress)
                        typeStack.push("flotante")
                    }
                }else if (ctx.Caracter() != nil){
                    let car = ctx.Caracter()?.getText()
                    if constTable[car!] != nil{
                        let virtualAddress = constTable[car!]!["virtualAddress"]
                        operandStack.push(virtualAddress!)
                        typeStack.push("char")
                    }else{
                        let virtualAddress = myTempVarGenerator.getConst("char")
                        constTable[car!] = [:]
                        constTable[car!]!["tipo"] = "char"
                        constTable[car!]!["virtualAddress"] = virtualAddress
                        operandStack.push(virtualAddress)
                        typeStack.push("char")
                    }
                }
            }
        }
        if (operatorStack.top() == "*" || operatorStack.top() == "/"){
            let rightOperand = operandStack.pop()!
            let rightType = typeStack.pop()!
            let leftOperand = operandStack.pop()!
            let leftType = typeStack.pop()!
            let myOperator = operatorStack.pop()!
            if semanticCube.chekCube(leftType: leftType, rightType: rightType, myOperator: myOperator) != nil{
                let resultType = semanticCube.chekCube(leftType: leftType, rightType: rightType, myOperator: myOperator)
                let myTempVar = myTempVarGenerator.getTempVar(resultType!)
                quadruples.append(Quadruple(myOperator, leftOperand, rightOperand, String(myTempVar)))
                operandStack.push(myTempVar)
                typeStack.push(resultType!)
            }else{
                print("Error, tipos \(leftType) y \(rightType) no son compatibles")
            }
        }
    }
    
    public func prepareArrayAccess(){
        operatorStack.push("(")
    }
    
    public func verifyArray(_ arrayName : String){
        if localVariableTable[arrayName]?["esArreglo"] == "true" {
            let operand = operandStack.pop()
            let type = typeStack.pop()
            let size = localVariableTable[arrayName]!["size"]
            let virtualAddress = localVariableTable[arrayName]!["virtualAddress"]!
            if type == "entero"{
                quadruples.append(Quadruple("verify", operand!, "0", size!))
                let arrayType = localVariableTable[arrayName]!["tipo"]
                let next = myTempVarGenerator.getTempVar(arrayType!)
                quadruples.append(Quadruple("+", operand!, virtualAddress, next))
                let pointer = "(" + next + ")"
                operandStack.push(pointer)
                typeStack.push(arrayType!)
                operatorStack.simplePop()
            }else{
                print("Error, la expresión debe de ser de tipo entero, no \(type!)")
            }
        }else if variableTable[arrayName]?["esArreglo"] == "true"{
            let operand = operandStack.pop()
            let type = typeStack.pop()
            let size = variableTable[arrayName]!["size"]
            let virtualAddress = variableTable[arrayName]!["virtualAddress"]!
            if type == "entero"{
                quadruples.append(Quadruple("verify", operand!, "0", size!))
                let arrayType = variableTable[arrayName]!["tipo"]
                let next = myTempVarGenerator.getTempVar(arrayType!)
                quadruples.append(Quadruple("+", operand!, virtualAddress, next))
                let pointer = "(" + next + ")"
                operandStack.push(pointer)
                typeStack.push(arrayType!)
                operatorStack.simplePop()
            }else{
                print("Error, la expresión debe de ser de tipo entero, no \(type!)")
            }
        }else{
            print("Error, la variable \(arrayName) no es un arreglo")
        }
    }
    
    public func visitTerminal(_ node: TerminalNode) {
        
    }
    
    public func visitErrorNode(_ node: ErrorNode) {
        
    }
    
    public func enterEveryRule(_ ctx: ParserRuleContext) throws {
        
    }
    
    public func exitEveryRule(_ ctx: ParserRuleContext) throws {
        
    }
    
    
}
