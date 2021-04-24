//
//  MyCustomListener.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 23/04/21.
//

import Foundation
import Antlr4

open class MyCustomListener : OnlyLonelyListener {
    
    var functionTable : [String: String]
    var variableTable : [String: String]
    
    init() {
        functionTable = [:]
        variableTable = [:]
    }
    
    public func enterRoot(_ ctx: OnlyLonelyParser.RootContext) {
        print("Start Parsing")
    }
    
    public func exitRoot(_ ctx: OnlyLonelyParser.RootContext) {
        print("End Parsing")
        print("Diccionario de Funciones")
        print(functionTable)
        print("Diccionario de Variables")
        print(variableTable)
    }
    
    public func enterDecVar(_ ctx: OnlyLonelyParser.DecVarContext) {
        
    }
    
    public func exitDecVar(_ ctx: OnlyLonelyParser.DecVarContext) {
        
    }
    
    public func enterListaVTipo(_ ctx: OnlyLonelyParser.ListaVTipoContext) {
        
    }
    
    public func obtenerIdsLista(_ listaNodos: Tree?) -> [Tree] {
        if listaNodos?.getChild(0) == nil {
            var lista = [Tree]()
            return lista
        }else {
            var lista = [Tree]()
            lista.append((listaNodos?.getChild(0)?.getChild(0))!)
            lista.append(contentsOf: obtenerIdsLista(listaNodos?.getChild(2)))
            return lista
        }
    }
    
    public func exitListaVTipo(_ ctx: OnlyLonelyParser.ListaVTipoContext) {
        let listaIds = ctx.getChild(0)
        let cantIds = listaIds?.getChildCount()
        if cantIds == 1 {
            let idVar = (listaIds?.getChild(0)?.getChild(0)?.toStringTree())!
            variableTable[idVar] = (ctx.tipo()?.getChild(0)?.toStringTree())!
        }else{
            let lista = obtenerIdsLista(listaIds)
            for i in 0...lista.count-1{
                let idVar = lista[i].toStringTree()
                variableTable[idVar] = ctx.tipo()?.getChild(0)?.toStringTree()
            }
        }
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
            if (functionTable[idFunc.description] != nil) {
                //Manda Error
            }else{
                functionTable[idFunc.description] = tipoRet!.toStringTree()
            }
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
