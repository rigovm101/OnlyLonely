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
    var variableTable : [String: String]
    let semanticCube : SemanticCube
    var quadruples : [Quadruple]
    var operandStack : Stack<String>
    var typeStack : Stack<String>
    var operatorStack : Stack<String>
    var jumpStack : Stack<Int>
    let myTempVarGenerator : TemporalVariableGenerator
    var currFuncName : String
    var localVariableTable : [String : String]
    var localVariableCounter : Int
    var currParam : Int
    
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
    }
    
    public func enterRoot(_ ctx: OnlyLonelyParser.RootContext) {
        
    }
    
    public func exitRoot(_ ctx: OnlyLonelyParser.RootContext) {
        print("Diccionario de Funciones")
        print(functionTable)
        print("Diccionario de Variables Globales")
        print(variableTable)
        print("Diccionario de Variables")
        print(localVariableTable)
        print("Pila de Operandos")
        while (operandStack.top() != nil) {
            print(operandStack.pop()!)
        }
        print("Pila de Tipos")
        while (typeStack.top() != nil) {
            print(typeStack.pop()!)
        }
        print("Pila de Operadores")
        while (operatorStack.top() != nil) {
            print(operatorStack.pop()!)
        }
        print("Pila de Saltos")
        while (jumpStack.top() != nil) {
            print(jumpStack.pop()!)
        }
        print("Cuadruplos")
        for quad in quadruples{
            print("\(quad.operationCode)\t\(quad.leftOperand)\t\(quad.rightOperand)\t\(quad.result)")
        }
        
    }
    
    public func enterDecVar(_ ctx: OnlyLonelyParser.DecVarContext) {
        
    }
    
    public func exitDecVar(_ ctx: OnlyLonelyParser.DecVarContext) {
        let values = ctx.listaVTipo()?.getText()
        let types = (values?.split(separator: ";"))!
        for type in types {
            let tType = type.split(separator: ":")
            let ids = tType[0].split(separator: ",")
            for id in ids {
                if variableTable[String(id)] == nil{
                    variableTable[String(id)] = String(tType[1])
                }else{
                    print("Error, variable \(id) ya ha sido declarada en este contexto")
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
        let types = (values?.split(separator: ";"))!
        for type in types {
            let tType = type.split(separator: ":")
            let ids = tType[0].split(separator: ",")
            for id in ids {
                if localVariableTable[String(id)] == nil{
                    localVariableTable[String(id)] = String(tType[1])
                    localVariableCounter += 1
                }else{
                    print("Error, variable \(id) ya ha sido declarada en este contexto")
                }
            }
        }
        functionTable[currFuncName]!["numLocalVars"] = String(localVariableCounter)
        functionTable[currFuncName]!["startPosition"] = String(quadruples.count)
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
            variableTable[id] = returnType
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
        quadruples.append(Quadruple("ENDFunc", "_", "_", "_"))
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
            localVariableTable[id] = type
            paramSequence?.append("\(type) ")
            functionTable[currFuncName]!["params"] = paramSequence
            numParams = numParams! + 1
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
    
    public func exitTAsignacion(_ ctx: OnlyLonelyParser.TAsignacionContext) {
        let id = ctx.Id()?.description
        if let type = localVariableTable[id!]{
            if let resultType = semanticCube.chekCube(leftType: type, rightType: typeStack.top()!, myOperator: "=") {
                quadruples.append(Quadruple("=", id!, "_", operandStack.pop()!))
                localVariableTable[id!] = resultType
                typeStack.simplePop()
            }else{
                print("Error, tipos \(type) y \(typeStack.pop()!) no son compatibles")
            }
        }else if let type = variableTable[id!]{
            if let resultType = semanticCube.chekCube(leftType: type, rightType: typeStack.top()!, myOperator: "=") {
                quadruples.append(Quadruple("=", id!, "_", operandStack.pop()!))
                variableTable[id!] = resultType
                typeStack.simplePop()
            }else{
                print("Error, tipos \(type) y \(typeStack.pop()!) no son compatibles")
            }
        } else{
            print("Error, la variable \(id!) no ha sido declarada en este contexto")
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
        quadruples.append(Quadruple("ERA", funcName, "_", "_"))
        currFuncName = funcName
    }
    
    public func processArgument(){
        let argument = operandStack.pop()
        let argumentType = typeStack.pop()
        let list = functionTable[currFuncName]!["params"]?.split(separator: " ")
        if list!.count == 0{
            print("Error, esta funcion no tiene parámetros")
        }else{
            if String(list![currParam]) == argumentType{
                quadruples.append(Quadruple("PARAMETER", argument!, "_", "param\(currParam)"))
                currParam = currParam + 1
            }else{
                print("Error, el arumento es de tipo incorrecto")
            }
        }
    }
    
    public func exitLlamadaVoid(_ ctx: OnlyLonelyParser.LlamadaVoidContext) {
        if currParam == Int(functionTable[currFuncName]!["numParams"]!) {
            quadruples.append(Quadruple("GOSUB", currFuncName, "_", functionTable[currFuncName]!["startPosition"]!))
            currParam = 0
        }else{
            print("Error, no se pasaron los argumentos necesarios para la función")
        }
    }
    
    public func enterLlamada(_ ctx: OnlyLonelyParser.LlamadaContext) {
        
    }
    
    public func exitLlamada(_ ctx: OnlyLonelyParser.LlamadaContext) {
        if currParam == Int(functionTable[currFuncName]!["numParams"]!) {
            quadruples.append(Quadruple("GOSUB", currFuncName, "_", functionTable[currFuncName]!["startPosition"]!))
            let tempVar = myTempVarGenerator.getTemporalVariable()
            quadruples.append(Quadruple("=", currFuncName, "_", tempVar))
            operandStack.push(tempVar)
            typeStack.push(functionTable[currFuncName]!["tRetorno"]!)
            currParam = 0
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
            quadruples.append(Quadruple("return", operand, "_", "_"))
        }
    }
    
    public func enterLectura(_ ctx: OnlyLonelyParser.LecturaContext) {
        
    }
    
    public func exitLectura(_ ctx: OnlyLonelyParser.LecturaContext) {
        let text = ctx.argumentos()?.getText()
        let ids = text?.split(separator: ",")
        for id in ids! {
            if (localVariableTable[String(id)] != nil) {
                quadruples.append(Quadruple("lee", "_", "_", String(id)))
            }else if (variableTable[String(id)] != nil) {
                quadruples.append(Quadruple("lee", "_", "_", String(id)))
            }else{
                print("Error, la variable \(String(id)) no se ha declarado")
            }
        }
    }
    
    public func enterEscritura(_ ctx: OnlyLonelyParser.EscrituraContext) {
        
    }
    
    public func exitEscritura(_ ctx: OnlyLonelyParser.EscrituraContext) {
        if (ctx.String() != nil) {
            let str = ctx.String()?.description
            quadruples.append(Quadruple("escribe", "_", "_", str!))
        }else{
            let operand = operandStack.pop()
            typeStack.simplePop()
            if operand != nil {
                quadruples.append(Quadruple("escribe", "_", "_", operand!))
            }
        }
    }
    
    public func saveJumpPoint(){
        if typeStack.pop() == "bool" {
            quadruples.append(Quadruple("gotof", operandStack.pop()!, "_", "?"))
            jumpStack.push(quadruples.count-1)
        }else{
            print("Error, se espera una expresión de tipo bool")
        }
    }
    
    public func writeElseSavePoint(){
        if let position = jumpStack.pop(){
            quadruples[position].setResult(String(quadruples.count+1))
        }
        quadruples.append(Quadruple("goto", "_", "_", "?"))
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
            quadruples.append(Quadruple("gotof", operandStack.pop()!, "_", "?"))
            jumpStack.push(quadruples.count-1)
        }else{
            print("Error, se esperaba un tipo bool")
        }
    }
    
    public func saveWhileBodyEnd(){
        let end = jumpStack.pop()
        let begining = jumpStack.pop()
        quadruples.append(Quadruple("goto", "_", "_", String(begining!)))
        quadruples[end!].setResult(String(quadruples.count))
    }
    
    public func enterTMientras(_ ctx: OnlyLonelyParser.TMientrasContext) {
        
    }
    
    public func exitTMientras(_ ctx: OnlyLonelyParser.TMientrasContext) {
        
    }
    
    public func varDeclarationForLoop(_ id: String){
        if typeStack.pop() == "entero" {
            quadruples.append(Quadruple("=", id, "_", operandStack.pop()!))
            operandStack.push(id)
            typeStack.push("entero")
        }
    }
    
    public func conditionForLoop(){
        if typeStack.pop() == "entero" {
            jumpStack.push(quadruples.count+1)
            let right = operandStack.pop()
            let left = operandStack.pop()
            let temp = myTempVarGenerator.getTemporalVariable()
            quadruples.append(Quadruple("<", left!, right!, temp))
            jumpStack.push(quadruples.count-1)
            typeStack.simplePop()
            quadruples.append(Quadruple("gotof", temp, "_", "?"))
        }
    }
    
    public func endForLoop(){
        let begin = jumpStack.pop()
        quadruples.append(Quadruple("goto", "_", "_", String(begin!)))
        let trail = jumpStack.pop()
        quadruples[trail!].setResult(String(quadruples.count))
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
                let myTempVar = myTempVarGenerator.getTemporalVariable()
                quadruples.append(Quadruple(myOperator, leftOperand, rightOperand, myTempVar))
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
                let myTempVar = myTempVarGenerator.getTemporalVariable()
                quadruples.append(Quadruple(myOperator, leftOperand, rightOperand, myTempVar))
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
                let myTempVar = myTempVarGenerator.getTemporalVariable()
                quadruples.append(Quadruple(myOperator, leftOperand, rightOperand, myTempVar))
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
            let id = ctx.getText()
            if let type = localVariableTable[id] {
                operandStack.push(id)
                typeStack.push(type)
            }else if let type = variableTable[id] {
                operandStack.push(id)
                typeStack.push(type)
            }else{
                if (ctx.Numero() != nil) {
                    operandStack.push(id)
                    typeStack.push("entero")
                }else if (ctx.NumFlotante() != nil){
                    operandStack.push(id)
                    typeStack.push("flotante")
                }else{
                    print("Error, la variable \(id) no ha sido declarada")
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
                let myTempVar = myTempVarGenerator.getTemporalVariable()
                quadruples.append(Quadruple(myOperator, leftOperand, rightOperand, myTempVar))
                operandStack.push(myTempVar)
                typeStack.push(resultType!)
            }else{
                print("Error, tipos \(leftType) y \(rightType) no son compatibles")
            }
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
