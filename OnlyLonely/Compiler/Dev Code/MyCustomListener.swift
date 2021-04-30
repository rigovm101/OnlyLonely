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
    
    init() {
        functionTable = [:]
        variableTable = [:]
        semanticCube = SemanticCube()
    }
    
    public func enterRoot(_ ctx: OnlyLonelyParser.RootContext) {

    }
    
    public func exitRoot(_ ctx: OnlyLonelyParser.RootContext) {
        print("Diccionario de Funciones")
        print(functionTable)
        print("Diccionario de Variables")
        print(variableTable)
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
    
    public func extractParameters(_ context: OnlyLonelyParser.ParametrosContext) -> [String: String]{
        if (context == nil){
            return [:]
        }else{
            let id = (context.getChild(0)?.toStringTree())!
            let tipo = (context.getChild(2)?.getChild(0)?.toStringTree())!;
            var elemento = [id:tipo]
            if(context.parametros() == nil){
                return elemento
            } else{
                let rest = extractParameters(context.parametros()!)
                elemento.merge(dict: rest)
                return elemento
            }
        }
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
        
    }
    
    public func enterEscritura(_ ctx: OnlyLonelyParser.EscrituraContext) {
        
    }
    
    public func exitEscritura(_ ctx: OnlyLonelyParser.EscrituraContext) {
        
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
    
    public func enterExpRel(_ ctx: OnlyLonelyParser.ExpRelContext) {
        
    }
    
    public func exitExpRel(_ ctx: OnlyLonelyParser.ExpRelContext) {
        
    }
    
    public func enterExpArit(_ ctx: OnlyLonelyParser.ExpAritContext) {
        
    }
    
    public func exitExpArit(_ ctx: OnlyLonelyParser.ExpAritContext) {
        
    }
    
    public func enterTermino(_ ctx: OnlyLonelyParser.TerminoContext) {
        
    }
    
    public func exitTermino(_ ctx: OnlyLonelyParser.TerminoContext) {
        
    }
    
    public func enterFactor(_ ctx: OnlyLonelyParser.FactorContext) {
        
    }
    
    public func exitFactor(_ ctx: OnlyLonelyParser.FactorContext) {
        
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
