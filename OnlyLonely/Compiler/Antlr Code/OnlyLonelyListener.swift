// Generated from OnlyLonely.g4 by ANTLR 4.9
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link OnlyLonelyParser}.
 */
public protocol OnlyLonelyListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#root}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRoot(_ ctx: OnlyLonelyParser.RootContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#root}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRoot(_ ctx: OnlyLonelyParser.RootContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#decVar}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDecVar(_ ctx: OnlyLonelyParser.DecVarContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#decVar}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDecVar(_ ctx: OnlyLonelyParser.DecVarContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#listaVTipo}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterListaVTipo(_ ctx: OnlyLonelyParser.ListaVTipoContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#listaVTipo}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitListaVTipo(_ ctx: OnlyLonelyParser.ListaVTipoContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#listaIds}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterListaIds(_ ctx: OnlyLonelyParser.ListaIdsContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#listaIds}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitListaIds(_ ctx: OnlyLonelyParser.ListaIdsContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#variable}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariable(_ ctx: OnlyLonelyParser.VariableContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#variable}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariable(_ ctx: OnlyLonelyParser.VariableContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#decFunc}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDecFunc(_ ctx: OnlyLonelyParser.DecFuncContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#decFunc}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDecFunc(_ ctx: OnlyLonelyParser.DecFuncContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#tFuncion}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTFuncion(_ ctx: OnlyLonelyParser.TFuncionContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#tFuncion}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTFuncion(_ ctx: OnlyLonelyParser.TFuncionContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#decVarLocal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDecVarLocal(_ ctx: OnlyLonelyParser.DecVarLocalContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#decVarLocal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDecVarLocal(_ ctx: OnlyLonelyParser.DecVarLocalContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#cuerpo}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCuerpo(_ ctx: OnlyLonelyParser.CuerpoContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#cuerpo}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCuerpo(_ ctx: OnlyLonelyParser.CuerpoContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#parametros}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParametros(_ ctx: OnlyLonelyParser.ParametrosContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#parametros}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParametros(_ ctx: OnlyLonelyParser.ParametrosContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#tPrincipal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTPrincipal(_ ctx: OnlyLonelyParser.TPrincipalContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#tPrincipal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTPrincipal(_ ctx: OnlyLonelyParser.TPrincipalContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#tipoRet}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTipoRet(_ ctx: OnlyLonelyParser.TipoRetContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#tipoRet}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTipoRet(_ ctx: OnlyLonelyParser.TipoRetContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#tipo}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTipo(_ ctx: OnlyLonelyParser.TipoContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#tipo}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTipo(_ ctx: OnlyLonelyParser.TipoContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#estatuto}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEstatuto(_ ctx: OnlyLonelyParser.EstatutoContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#estatuto}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEstatuto(_ ctx: OnlyLonelyParser.EstatutoContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#tAsignacion}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTAsignacion(_ ctx: OnlyLonelyParser.TAsignacionContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#tAsignacion}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTAsignacion(_ ctx: OnlyLonelyParser.TAsignacionContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#llamadaVoid}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLlamadaVoid(_ ctx: OnlyLonelyParser.LlamadaVoidContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#llamadaVoid}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLlamadaVoid(_ ctx: OnlyLonelyParser.LlamadaVoidContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#argumentos}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArgumentos(_ ctx: OnlyLonelyParser.ArgumentosContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#argumentos}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArgumentos(_ ctx: OnlyLonelyParser.ArgumentosContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#retornoFunc}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRetornoFunc(_ ctx: OnlyLonelyParser.RetornoFuncContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#retornoFunc}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRetornoFunc(_ ctx: OnlyLonelyParser.RetornoFuncContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#lectura}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLectura(_ ctx: OnlyLonelyParser.LecturaContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#lectura}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLectura(_ ctx: OnlyLonelyParser.LecturaContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#escritura}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEscritura(_ ctx: OnlyLonelyParser.EscrituraContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#escritura}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEscritura(_ ctx: OnlyLonelyParser.EscrituraContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#estDesicion}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEstDesicion(_ ctx: OnlyLonelyParser.EstDesicionContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#estDesicion}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEstDesicion(_ ctx: OnlyLonelyParser.EstDesicionContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#tSino}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTSino(_ ctx: OnlyLonelyParser.TSinoContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#tSino}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTSino(_ ctx: OnlyLonelyParser.TSinoContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#tMientras}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTMientras(_ ctx: OnlyLonelyParser.TMientrasContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#tMientras}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTMientras(_ ctx: OnlyLonelyParser.TMientrasContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#tDesde}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTDesde(_ ctx: OnlyLonelyParser.TDesdeContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#tDesde}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTDesde(_ ctx: OnlyLonelyParser.TDesdeContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#exp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExp(_ ctx: OnlyLonelyParser.ExpContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#exp}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExp(_ ctx: OnlyLonelyParser.ExpContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#expRel}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpRel(_ ctx: OnlyLonelyParser.ExpRelContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#expRel}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpRel(_ ctx: OnlyLonelyParser.ExpRelContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#expArit}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpArit(_ ctx: OnlyLonelyParser.ExpAritContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#expArit}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpArit(_ ctx: OnlyLonelyParser.ExpAritContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#termino}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTermino(_ ctx: OnlyLonelyParser.TerminoContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#termino}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTermino(_ ctx: OnlyLonelyParser.TerminoContext)
	/**
	 * Enter a parse tree produced by {@link OnlyLonelyParser#factor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFactor(_ ctx: OnlyLonelyParser.FactorContext)
	/**
	 * Exit a parse tree produced by {@link OnlyLonelyParser#factor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFactor(_ ctx: OnlyLonelyParser.FactorContext)
}