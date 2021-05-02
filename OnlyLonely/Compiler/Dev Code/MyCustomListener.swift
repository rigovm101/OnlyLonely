//
//  MyCustomListener.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 23/04/21.
//

import Foundation
import Antlr4

open class MyCustomListener : OnlyLonelyListener {
    
    var functionTable : [String: [String : [String : String]]]
    var variableTable : [String: String]
    let semanticCube : SemanticCube
    var quadruples : [Quadruple]
    var operandStack : Stack<String>
    var typeStack : Stack<String>
    var operatorStack : Stack<String>
    var jumpStack : Stack<Int>
    let myTempVarGenerator : TemporalVariableGenerator
    
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
    }
    
    public func enterRoot(_ ctx: OnlyLonelyParser.RootContext) {

    }
    
    public func exitRoot(_ ctx: OnlyLonelyParser.RootContext) {
        print("Diccionario de Funciones")
        print(functionTable)
        print("Diccionario de Variables")
        print(variableTable)
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
        print("Cuadruplos")
        for quad in quadruples{
            print("\(quad.operationCode) \(quad.leftOperand) \(quad.rightOperand) \(quad.result)")
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
    
    public func enterTFuncion(_ ctx: OnlyLonelyParser.TFuncionContext) {
        
    }
    
    public func exitTFuncion(_ ctx: OnlyLonelyParser.TFuncionContext) {
        if let idFunc = ctx.Id() {
            let tipoRet = ctx.tipoRet()?.getChild(0)
            functionTable[idFunc.description] = [tipoRet!.toStringTree() : [:]]
        }
    }
    
    public func enterCuerpo(_ ctx: OnlyLonelyParser.CuerpoContext) {
        
    }
    
    public func exitCuerpo(_ ctx: OnlyLonelyParser.CuerpoContext) {
        
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
        let type = variableTable[id!]
        if let resultType = semanticCube.chekCube(leftType: type!, rightType: typeStack.top()!, myOperator: "=") {
            quadruples.append(Quadruple("=", id!, "_", operandStack.pop()!))
            variableTable[id!] = resultType
            typeStack.pop()
        }else{
            print("Error, tipos \(type!) y \(typeStack.pop()!) no son compatibles")
        }
    }
    
    public func enterLlamadaVoid(_ ctx: OnlyLonelyParser.LlamadaVoidContext) {
        
    }
    
    public func exitLlamadaVoid(_ ctx: OnlyLonelyParser.LlamadaVoidContext) {
        
    }
    
    public func enterArgumentos(_ ctx: OnlyLonelyParser.ArgumentosContext) {
        
    }
    
    public func exitArgumentos(_ ctx: OnlyLonelyParser.ArgumentosContext) {
        
    }
    
    public func enterRetornoFunc(_ ctx: OnlyLonelyParser.RetornoFuncContext) {
        
    }
    
    public func exitRetornoFunc(_ ctx: OnlyLonelyParser.RetornoFuncContext) {
        
    }
    
    public func enterLectura(_ ctx: OnlyLonelyParser.LecturaContext) {
        
    }
    
    public func exitLectura(_ ctx: OnlyLonelyParser.LecturaContext) {
        let text = ctx.argumentos()?.getText()
        let ids = text?.split(separator: ",")
        for id in ids! {
            if (variableTable[String(id)] != nil) {
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
            typeStack.pop()
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
    
    public func enterTMientras(_ ctx: OnlyLonelyParser.TMientrasContext) {
        
    }
    
    public func exitTMientras(_ ctx: OnlyLonelyParser.TMientrasContext) {
        
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
            operatorStack.pop()
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
        let id = ctx.getText()
        if let type = variableTable[id] {
            operandStack.push(id)
            typeStack.push(type)
        }else{
            print("Error, la variable \(id) no ha sido declarada")
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
