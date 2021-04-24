// Generated from OnlyLonely.g4 by ANTLR 4.9
import Antlr4

open class OnlyLonelyParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = OnlyLonelyParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(OnlyLonelyParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, Programa = 1, Variables = 2, Funcion = 3, Void = 4, Entero = 5, 
                 Flotante = 6, Char = 7, Regresa = 8, Lee = 9, Escribe = 10, 
                 Si = 11, Entonces = 12, Sino = 13, Principal = 14, Mientras = 15, 
                 Hacer = 16, Desde = 17, Hasta = 18, TokenOr = 19, TokenAnd = 20, 
                 MayorQue = 21, MenorQue = 22, Asignacion = 23, IgualQue = 24, 
                 DiferenteQue = 25, Suma = 26, Resta = 27, Multiplicacion = 28, 
                 Division = 29, AbreParentesis = 30, CierraParentesis = 31, 
                 AbreLlave = 32, CierraLlave = 33, AbreCorchete = 34, CierraCorchete = 35, 
                 DosPuntos = 36, PuntoComa = 37, Coma = 38, Numero = 39, 
                 NumFlotante = 40, String = 41, Id = 42, IdFunc = 43, WS = 44
	}

	public
	static let RULE_root = 0, RULE_decVar = 1, RULE_listaVTipo = 2, RULE_listaIds = 3, 
            RULE_variable = 4, RULE_decFunc = 5, RULE_tFuncion = 6, RULE_cuerpo = 7, 
            RULE_parametros = 8, RULE_tPrincipal = 9, RULE_tipoRet = 10, 
            RULE_tipo = 11, RULE_estatuto = 12, RULE_tAsignacion = 13, RULE_llamadaVoid = 14, 
            RULE_argumentos = 15, RULE_retornoFunc = 16, RULE_lectura = 17, 
            RULE_escritura = 18, RULE_estDesicion = 19, RULE_tSino = 20, 
            RULE_tMientras = 21, RULE_tDesde = 22, RULE_exp = 23, RULE_expRel = 24, 
            RULE_expArit = 25, RULE_termino = 26, RULE_factor = 27

	public
	static let ruleNames: [String] = [
		"root", "decVar", "listaVTipo", "listaIds", "variable", "decFunc", "tFuncion", 
		"cuerpo", "parametros", "tPrincipal", "tipoRet", "tipo", "estatuto", "tAsignacion", 
		"llamadaVoid", "argumentos", "retornoFunc", "lectura", "escritura", "estDesicion", 
		"tSino", "tMientras", "tDesde", "exp", "expRel", "expArit", "termino", 
		"factor"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'programa'", "'variables'", "'funcion'", "'void'", "'entero'", "'flotante'", 
		"'char'", "'regresa'", "'lee'", "'escribe'", "'si'", "'entonces'", "'sino'", 
		"'principal'", "'mientras'", "'hacer'", "'desde'", "'hasta'", "'|'", "'&'", 
		"'>'", "'<'", "'='", "'=='", "'!='", "'+'", "'-'", "'*'", "'/'", "'('", 
		"')'", "'{'", "'}'", "'['", "']'", "':'", "';'", "','"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "Programa", "Variables", "Funcion", "Void", "Entero", "Flotante", 
		"Char", "Regresa", "Lee", "Escribe", "Si", "Entonces", "Sino", "Principal", 
		"Mientras", "Hacer", "Desde", "Hasta", "TokenOr", "TokenAnd", "MayorQue", 
		"MenorQue", "Asignacion", "IgualQue", "DiferenteQue", "Suma", "Resta", 
		"Multiplicacion", "Division", "AbreParentesis", "CierraParentesis", "AbreLlave", 
		"CierraLlave", "AbreCorchete", "CierraCorchete", "DosPuntos", "PuntoComa", 
		"Coma", "Numero", "NumFlotante", "String", "Id", "IdFunc", "WS"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "OnlyLonely.g4" }

	override open
	func getRuleNames() -> [String] { return OnlyLonelyParser.ruleNames }

	override open
	func getSerializedATN() -> String { return OnlyLonelyParser._serializedATN }

	override open
	func getATN() -> ATN { return OnlyLonelyParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return OnlyLonelyParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.9", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,OnlyLonelyParser._ATN,OnlyLonelyParser._decisionToDFA, OnlyLonelyParser._sharedContextCache)
	}


	public class RootContext: ParserRuleContext {
			open
			func Programa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Programa.rawValue, 0)
			}
			open
			func IdFunc() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.IdFunc.rawValue, 0)
			}
			open
			func PuntoComa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.PuntoComa.rawValue, 0)
			}
			open
			func decVar() -> DecVarContext? {
				return getRuleContext(DecVarContext.self, 0)
			}
			open
			func decFunc() -> DecFuncContext? {
				return getRuleContext(DecFuncContext.self, 0)
			}
			open
			func tPrincipal() -> TPrincipalContext? {
				return getRuleContext(TPrincipalContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_root
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterRoot(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitRoot(self)
			}
		}
	}
	@discardableResult
	 open func root() throws -> RootContext {
        let _localctx: RootContext = RootContext(_ctx, getState())
		try enterRule(_localctx, 0, OnlyLonelyParser.RULE_root)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(56)
		 	try match(OnlyLonelyParser.Tokens.Programa.rawValue)
		 	setState(57)
		 	try match(OnlyLonelyParser.Tokens.IdFunc.rawValue)
		 	setState(58)
		 	try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)
		 	setState(59)
		 	try decVar()
		 	setState(60)
		 	try decFunc()
		 	setState(61)
		 	try tPrincipal()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DecVarContext: ParserRuleContext {
			open
			func Variables() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Variables.rawValue, 0)
			}
			open
			func listaVTipo() -> ListaVTipoContext? {
				return getRuleContext(ListaVTipoContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_decVar
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterDecVar(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitDecVar(self)
			}
		}
	}
	@discardableResult
	 open func decVar() throws -> DecVarContext {
        let _localctx: DecVarContext = DecVarContext(_ctx, getState())
		try enterRule(_localctx, 2, OnlyLonelyParser.RULE_decVar)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(66)
		 	try _errHandler.sync(self)
		 	switch (OnlyLonelyParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .Variables:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(63)
		 		try match(OnlyLonelyParser.Tokens.Variables.rawValue)
		 		setState(64)
		 		try listaVTipo()

		 		break
		 	case .Void:fallthrough
		 	case .Entero:fallthrough
		 	case .Flotante:fallthrough
		 	case .Char:fallthrough
		 	case .Principal:fallthrough
		 	case .AbreLlave:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ListaVTipoContext: ParserRuleContext {
			open
			func listaIds() -> ListaIdsContext? {
				return getRuleContext(ListaIdsContext.self, 0)
			}
			open
			func DosPuntos() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.DosPuntos.rawValue, 0)
			}
			open
			func tipo() -> TipoContext? {
				return getRuleContext(TipoContext.self, 0)
			}
			open
			func PuntoComa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.PuntoComa.rawValue, 0)
			}
			open
			func listaVTipo() -> ListaVTipoContext? {
				return getRuleContext(ListaVTipoContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_listaVTipo
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterListaVTipo(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitListaVTipo(self)
			}
		}
	}
	@discardableResult
	 open func listaVTipo() throws -> ListaVTipoContext {
        let _localctx: ListaVTipoContext = ListaVTipoContext(_ctx, getState())
		try enterRule(_localctx, 4, OnlyLonelyParser.RULE_listaVTipo)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(79)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,1, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(68)
		 		try listaIds()
		 		setState(69)
		 		try match(OnlyLonelyParser.Tokens.DosPuntos.rawValue)
		 		setState(70)
		 		try tipo()
		 		setState(71)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)
		 		setState(72)
		 		try listaVTipo()


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(74)
		 		try listaIds()
		 		setState(75)
		 		try match(OnlyLonelyParser.Tokens.DosPuntos.rawValue)
		 		setState(76)
		 		try tipo()
		 		setState(77)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ListaIdsContext: ParserRuleContext {
			open
			func variable() -> VariableContext? {
				return getRuleContext(VariableContext.self, 0)
			}
			open
			func Coma() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Coma.rawValue, 0)
			}
			open
			func listaIds() -> ListaIdsContext? {
				return getRuleContext(ListaIdsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_listaIds
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterListaIds(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitListaIds(self)
			}
		}
	}
	@discardableResult
	 open func listaIds() throws -> ListaIdsContext {
        let _localctx: ListaIdsContext = ListaIdsContext(_ctx, getState())
		try enterRule(_localctx, 6, OnlyLonelyParser.RULE_listaIds)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(86)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,2, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(81)
		 		try variable()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(82)
		 		try variable()
		 		setState(83)
		 		try match(OnlyLonelyParser.Tokens.Coma.rawValue)
		 		setState(84)
		 		try listaIds()


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VariableContext: ParserRuleContext {
			open
			func Id() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Id.rawValue, 0)
			}
			open
			func AbreCorchete() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreCorchete.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func CierraCorchete() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraCorchete.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_variable
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterVariable(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitVariable(self)
			}
		}
	}
	@discardableResult
	 open func variable() throws -> VariableContext {
        let _localctx: VariableContext = VariableContext(_ctx, getState())
		try enterRule(_localctx, 8, OnlyLonelyParser.RULE_variable)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(94)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(88)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(89)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 		setState(90)
		 		try match(OnlyLonelyParser.Tokens.AbreCorchete.rawValue)
		 		setState(91)
		 		try exp()
		 		setState(92)
		 		try match(OnlyLonelyParser.Tokens.CierraCorchete.rawValue)


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DecFuncContext: ParserRuleContext {
			open
			func tFuncion() -> [TFuncionContext] {
				return getRuleContexts(TFuncionContext.self)
			}
			open
			func tFuncion(_ i: Int) -> TFuncionContext? {
				return getRuleContext(TFuncionContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_decFunc
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterDecFunc(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitDecFunc(self)
			}
		}
	}
	@discardableResult
	 open func decFunc() throws -> DecFuncContext {
        let _localctx: DecFuncContext = DecFuncContext(_ctx, getState())
		try enterRule(_localctx, 10, OnlyLonelyParser.RULE_decFunc)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(99)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, OnlyLonelyParser.Tokens.Void.rawValue,OnlyLonelyParser.Tokens.Entero.rawValue,OnlyLonelyParser.Tokens.Flotante.rawValue,OnlyLonelyParser.Tokens.Char.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(96)
		 		try tFuncion()


		 		setState(101)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TFuncionContext: ParserRuleContext {
			open
			func tipoRet() -> TipoRetContext? {
				return getRuleContext(TipoRetContext.self, 0)
			}
			open
			func Funcion() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Funcion.rawValue, 0)
			}
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func parametros() -> ParametrosContext? {
				return getRuleContext(ParametrosContext.self, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
			open
			func decVar() -> DecVarContext? {
				return getRuleContext(DecVarContext.self, 0)
			}
			open
			func AbreLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreLlave.rawValue, 0)
			}
			open
			func cuerpo() -> CuerpoContext? {
				return getRuleContext(CuerpoContext.self, 0)
			}
			open
			func CierraLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraLlave.rawValue, 0)
			}
			open
			func Id() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Id.rawValue, 0)
			}
			open
			func IdFunc() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.IdFunc.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_tFuncion
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTFuncion(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTFuncion(self)
			}
		}
	}
	@discardableResult
	 open func tFuncion() throws -> TFuncionContext {
        let _localctx: TFuncionContext = TFuncionContext(_ctx, getState())
		try enterRule(_localctx, 12, OnlyLonelyParser.RULE_tFuncion)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(102)
		 	try tipoRet()
		 	setState(103)
		 	try match(OnlyLonelyParser.Tokens.Funcion.rawValue)
		 	setState(104)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == OnlyLonelyParser.Tokens.Id.rawValue || _la == OnlyLonelyParser.Tokens.IdFunc.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(105)
		 	try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 	setState(106)
		 	try parametros()
		 	setState(107)
		 	try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 	setState(108)
		 	try decVar()
		 	setState(109)
		 	try match(OnlyLonelyParser.Tokens.AbreLlave.rawValue)
		 	setState(110)
		 	try cuerpo()
		 	setState(111)
		 	try match(OnlyLonelyParser.Tokens.CierraLlave.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CuerpoContext: ParserRuleContext {
			open
			func estatuto() -> [EstatutoContext] {
				return getRuleContexts(EstatutoContext.self)
			}
			open
			func estatuto(_ i: Int) -> EstatutoContext? {
				return getRuleContext(EstatutoContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_cuerpo
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterCuerpo(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitCuerpo(self)
			}
		}
	}
	@discardableResult
	 open func cuerpo() throws -> CuerpoContext {
        let _localctx: CuerpoContext = CuerpoContext(_ctx, getState())
		try enterRule(_localctx, 14, OnlyLonelyParser.RULE_cuerpo)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(116)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, OnlyLonelyParser.Tokens.Regresa.rawValue,OnlyLonelyParser.Tokens.Lee.rawValue,OnlyLonelyParser.Tokens.Escribe.rawValue,OnlyLonelyParser.Tokens.Si.rawValue,OnlyLonelyParser.Tokens.Mientras.rawValue,OnlyLonelyParser.Tokens.Desde.rawValue,OnlyLonelyParser.Tokens.Id.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(113)
		 		try estatuto()


		 		setState(118)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParametrosContext: ParserRuleContext {
			open
			func Id() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Id.rawValue, 0)
			}
			open
			func DosPuntos() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.DosPuntos.rawValue, 0)
			}
			open
			func tipo() -> TipoContext? {
				return getRuleContext(TipoContext.self, 0)
			}
			open
			func Coma() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Coma.rawValue, 0)
			}
			open
			func parametros() -> ParametrosContext? {
				return getRuleContext(ParametrosContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_parametros
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterParametros(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitParametros(self)
			}
		}
	}
	@discardableResult
	 open func parametros() throws -> ParametrosContext {
        let _localctx: ParametrosContext = ParametrosContext(_ctx, getState())
		try enterRule(_localctx, 16, OnlyLonelyParser.RULE_parametros)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(129)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,6, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(119)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 		setState(120)
		 		try match(OnlyLonelyParser.Tokens.DosPuntos.rawValue)
		 		setState(121)
		 		try tipo()


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(122)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 		setState(123)
		 		try match(OnlyLonelyParser.Tokens.DosPuntos.rawValue)
		 		setState(124)
		 		try tipo()
		 		setState(125)
		 		try match(OnlyLonelyParser.Tokens.Coma.rawValue)
		 		setState(126)
		 		try parametros()


		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TPrincipalContext: ParserRuleContext {
			open
			func Principal() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Principal.rawValue, 0)
			}
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
			open
			func AbreLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreLlave.rawValue, 0)
			}
			open
			func cuerpo() -> CuerpoContext? {
				return getRuleContext(CuerpoContext.self, 0)
			}
			open
			func CierraLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraLlave.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_tPrincipal
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTPrincipal(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTPrincipal(self)
			}
		}
	}
	@discardableResult
	 open func tPrincipal() throws -> TPrincipalContext {
        let _localctx: TPrincipalContext = TPrincipalContext(_ctx, getState())
		try enterRule(_localctx, 18, OnlyLonelyParser.RULE_tPrincipal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(131)
		 	try match(OnlyLonelyParser.Tokens.Principal.rawValue)
		 	setState(132)
		 	try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 	setState(133)
		 	try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 	setState(134)
		 	try match(OnlyLonelyParser.Tokens.AbreLlave.rawValue)
		 	setState(135)
		 	try cuerpo()
		 	setState(136)
		 	try match(OnlyLonelyParser.Tokens.CierraLlave.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TipoRetContext: ParserRuleContext {
			open
			func Void() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Void.rawValue, 0)
			}
			open
			func Entero() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Entero.rawValue, 0)
			}
			open
			func Flotante() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Flotante.rawValue, 0)
			}
			open
			func Char() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Char.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_tipoRet
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTipoRet(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTipoRet(self)
			}
		}
	}
	@discardableResult
	 open func tipoRet() throws -> TipoRetContext {
        let _localctx: TipoRetContext = TipoRetContext(_ctx, getState())
		try enterRule(_localctx, 20, OnlyLonelyParser.RULE_tipoRet)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(138)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, OnlyLonelyParser.Tokens.Void.rawValue,OnlyLonelyParser.Tokens.Entero.rawValue,OnlyLonelyParser.Tokens.Flotante.rawValue,OnlyLonelyParser.Tokens.Char.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TipoContext: ParserRuleContext {
			open
			func Entero() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Entero.rawValue, 0)
			}
			open
			func Flotante() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Flotante.rawValue, 0)
			}
			open
			func Char() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Char.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_tipo
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTipo(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTipo(self)
			}
		}
	}
	@discardableResult
	 open func tipo() throws -> TipoContext {
        let _localctx: TipoContext = TipoContext(_ctx, getState())
		try enterRule(_localctx, 22, OnlyLonelyParser.RULE_tipo)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(140)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, OnlyLonelyParser.Tokens.Entero.rawValue,OnlyLonelyParser.Tokens.Flotante.rawValue,OnlyLonelyParser.Tokens.Char.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EstatutoContext: ParserRuleContext {
			open
			func tAsignacion() -> TAsignacionContext? {
				return getRuleContext(TAsignacionContext.self, 0)
			}
			open
			func retornoFunc() -> RetornoFuncContext? {
				return getRuleContext(RetornoFuncContext.self, 0)
			}
			open
			func lectura() -> LecturaContext? {
				return getRuleContext(LecturaContext.self, 0)
			}
			open
			func escritura() -> EscrituraContext? {
				return getRuleContext(EscrituraContext.self, 0)
			}
			open
			func estDesicion() -> EstDesicionContext? {
				return getRuleContext(EstDesicionContext.self, 0)
			}
			open
			func tMientras() -> TMientrasContext? {
				return getRuleContext(TMientrasContext.self, 0)
			}
			open
			func tDesde() -> TDesdeContext? {
				return getRuleContext(TDesdeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_estatuto
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterEstatuto(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitEstatuto(self)
			}
		}
	}
	@discardableResult
	 open func estatuto() throws -> EstatutoContext {
        let _localctx: EstatutoContext = EstatutoContext(_ctx, getState())
		try enterRule(_localctx, 24, OnlyLonelyParser.RULE_estatuto)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(149)
		 	try _errHandler.sync(self)
		 	switch (OnlyLonelyParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .Id:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(142)
		 		try tAsignacion()

		 		break

		 	case .Regresa:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(143)
		 		try retornoFunc()

		 		break

		 	case .Lee:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(144)
		 		try lectura()

		 		break

		 	case .Escribe:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(145)
		 		try escritura()

		 		break

		 	case .Si:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(146)
		 		try estDesicion()

		 		break

		 	case .Mientras:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(147)
		 		try tMientras()

		 		break

		 	case .Desde:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(148)
		 		try tDesde()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TAsignacionContext: ParserRuleContext {
			open
			func Id() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Id.rawValue, 0)
			}
			open
			func Asignacion() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Asignacion.rawValue, 0)
			}
			open
			func exp() -> [ExpContext] {
				return getRuleContexts(ExpContext.self)
			}
			open
			func exp(_ i: Int) -> ExpContext? {
				return getRuleContext(ExpContext.self, i)
			}
			open
			func PuntoComa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.PuntoComa.rawValue, 0)
			}
			open
			func AbreCorchete() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreCorchete.rawValue, 0)
			}
			open
			func CierraCorchete() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraCorchete.rawValue, 0)
			}
			open
			func IdFunc() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.IdFunc.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_tAsignacion
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTAsignacion(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTAsignacion(self)
			}
		}
	}
	@discardableResult
	 open func tAsignacion() throws -> TAsignacionContext {
        let _localctx: TAsignacionContext = TAsignacionContext(_ctx, getState())
		try enterRule(_localctx, 26, OnlyLonelyParser.RULE_tAsignacion)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(168)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,8, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(151)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 		setState(152)
		 		try match(OnlyLonelyParser.Tokens.Asignacion.rawValue)
		 		setState(153)
		 		try exp()
		 		setState(154)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(156)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 		setState(157)
		 		try match(OnlyLonelyParser.Tokens.AbreCorchete.rawValue)
		 		setState(158)
		 		try exp()
		 		setState(159)
		 		try match(OnlyLonelyParser.Tokens.CierraCorchete.rawValue)
		 		setState(160)
		 		try match(OnlyLonelyParser.Tokens.Asignacion.rawValue)
		 		setState(161)
		 		try exp()
		 		setState(162)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)


		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(164)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 		setState(165)
		 		try match(OnlyLonelyParser.Tokens.Asignacion.rawValue)
		 		setState(166)
		 		try match(OnlyLonelyParser.Tokens.IdFunc.rawValue)
		 		setState(167)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LlamadaVoidContext: ParserRuleContext {
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
			open
			func PuntoComa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.PuntoComa.rawValue, 0)
			}
			open
			func Id() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Id.rawValue, 0)
			}
			open
			func IdFunc() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.IdFunc.rawValue, 0)
			}
			open
			func argumentos() -> ArgumentosContext? {
				return getRuleContext(ArgumentosContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_llamadaVoid
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterLlamadaVoid(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitLlamadaVoid(self)
			}
		}
	}
	@discardableResult
	 open func llamadaVoid() throws -> LlamadaVoidContext {
        let _localctx: LlamadaVoidContext = LlamadaVoidContext(_ctx, getState())
		try enterRule(_localctx, 28, OnlyLonelyParser.RULE_llamadaVoid)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(180)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,9, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(170)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == OnlyLonelyParser.Tokens.Id.rawValue || _la == OnlyLonelyParser.Tokens.IdFunc.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(171)
		 		try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 		setState(172)
		 		try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 		setState(173)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(174)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == OnlyLonelyParser.Tokens.Id.rawValue || _la == OnlyLonelyParser.Tokens.IdFunc.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(175)
		 		try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 		setState(176)
		 		try argumentos()
		 		setState(177)
		 		try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 		setState(178)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArgumentosContext: ParserRuleContext {
			open
			func Id() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Id.rawValue, 0)
			}
			open
			func Coma() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Coma.rawValue, 0)
			}
			open
			func argumentos() -> ArgumentosContext? {
				return getRuleContext(ArgumentosContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_argumentos
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterArgumentos(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitArgumentos(self)
			}
		}
	}
	@discardableResult
	 open func argumentos() throws -> ArgumentosContext {
        let _localctx: ArgumentosContext = ArgumentosContext(_ctx, getState())
		try enterRule(_localctx, 30, OnlyLonelyParser.RULE_argumentos)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(186)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,10, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(182)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(183)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 		setState(184)
		 		try match(OnlyLonelyParser.Tokens.Coma.rawValue)
		 		setState(185)
		 		try argumentos()


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class RetornoFuncContext: ParserRuleContext {
			open
			func Regresa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Regresa.rawValue, 0)
			}
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
			open
			func PuntoComa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.PuntoComa.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_retornoFunc
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterRetornoFunc(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitRetornoFunc(self)
			}
		}
	}
	@discardableResult
	 open func retornoFunc() throws -> RetornoFuncContext {
        let _localctx: RetornoFuncContext = RetornoFuncContext(_ctx, getState())
		try enterRule(_localctx, 32, OnlyLonelyParser.RULE_retornoFunc)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(188)
		 	try match(OnlyLonelyParser.Tokens.Regresa.rawValue)
		 	setState(189)
		 	try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 	setState(190)
		 	try exp()
		 	setState(191)
		 	try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 	setState(192)
		 	try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LecturaContext: ParserRuleContext {
			open
			func Lee() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Lee.rawValue, 0)
			}
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func argumentos() -> ArgumentosContext? {
				return getRuleContext(ArgumentosContext.self, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
			open
			func PuntoComa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.PuntoComa.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_lectura
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterLectura(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitLectura(self)
			}
		}
	}
	@discardableResult
	 open func lectura() throws -> LecturaContext {
        let _localctx: LecturaContext = LecturaContext(_ctx, getState())
		try enterRule(_localctx, 34, OnlyLonelyParser.RULE_lectura)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(194)
		 	try match(OnlyLonelyParser.Tokens.Lee.rawValue)
		 	setState(195)
		 	try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 	setState(196)
		 	try argumentos()
		 	setState(197)
		 	try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 	setState(198)
		 	try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EscrituraContext: ParserRuleContext {
			open
			func Escribe() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Escribe.rawValue, 0)
			}
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
			open
			func PuntoComa() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.PuntoComa.rawValue, 0)
			}
			open
			func String() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.String.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_escritura
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterEscritura(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitEscritura(self)
			}
		}
	}
	@discardableResult
	 open func escritura() throws -> EscrituraContext {
        let _localctx: EscrituraContext = EscrituraContext(_ctx, getState())
		try enterRule(_localctx, 36, OnlyLonelyParser.RULE_escritura)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(211)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,11, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(200)
		 		try match(OnlyLonelyParser.Tokens.Escribe.rawValue)
		 		setState(201)
		 		try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 		setState(202)
		 		try exp()
		 		setState(203)
		 		try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 		setState(204)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(206)
		 		try match(OnlyLonelyParser.Tokens.Escribe.rawValue)
		 		setState(207)
		 		try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 		setState(208)
		 		try match(OnlyLonelyParser.Tokens.String.rawValue)
		 		setState(209)
		 		try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 		setState(210)
		 		try match(OnlyLonelyParser.Tokens.PuntoComa.rawValue)


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EstDesicionContext: ParserRuleContext {
			open
			func Si() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Si.rawValue, 0)
			}
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
			open
			func Entonces() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Entonces.rawValue, 0)
			}
			open
			func AbreLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreLlave.rawValue, 0)
			}
			open
			func cuerpo() -> CuerpoContext? {
				return getRuleContext(CuerpoContext.self, 0)
			}
			open
			func CierraLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraLlave.rawValue, 0)
			}
			open
			func tSino() -> TSinoContext? {
				return getRuleContext(TSinoContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_estDesicion
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterEstDesicion(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitEstDesicion(self)
			}
		}
	}
	@discardableResult
	 open func estDesicion() throws -> EstDesicionContext {
        let _localctx: EstDesicionContext = EstDesicionContext(_ctx, getState())
		try enterRule(_localctx, 38, OnlyLonelyParser.RULE_estDesicion)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(232)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,12, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(213)
		 		try match(OnlyLonelyParser.Tokens.Si.rawValue)
		 		setState(214)
		 		try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 		setState(215)
		 		try exp()
		 		setState(216)
		 		try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 		setState(217)
		 		try match(OnlyLonelyParser.Tokens.Entonces.rawValue)
		 		setState(218)
		 		try match(OnlyLonelyParser.Tokens.AbreLlave.rawValue)
		 		setState(219)
		 		try cuerpo()
		 		setState(220)
		 		try match(OnlyLonelyParser.Tokens.CierraLlave.rawValue)
		 		setState(221)
		 		try tSino()


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(223)
		 		try match(OnlyLonelyParser.Tokens.Si.rawValue)
		 		setState(224)
		 		try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 		setState(225)
		 		try exp()
		 		setState(226)
		 		try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 		setState(227)
		 		try match(OnlyLonelyParser.Tokens.Entonces.rawValue)
		 		setState(228)
		 		try match(OnlyLonelyParser.Tokens.AbreLlave.rawValue)
		 		setState(229)
		 		try cuerpo()
		 		setState(230)
		 		try match(OnlyLonelyParser.Tokens.CierraLlave.rawValue)


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TSinoContext: ParserRuleContext {
			open
			func Sino() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Sino.rawValue, 0)
			}
			open
			func AbreLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreLlave.rawValue, 0)
			}
			open
			func cuerpo() -> CuerpoContext? {
				return getRuleContext(CuerpoContext.self, 0)
			}
			open
			func CierraLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraLlave.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_tSino
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTSino(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTSino(self)
			}
		}
	}
	@discardableResult
	 open func tSino() throws -> TSinoContext {
        let _localctx: TSinoContext = TSinoContext(_ctx, getState())
		try enterRule(_localctx, 40, OnlyLonelyParser.RULE_tSino)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(234)
		 	try match(OnlyLonelyParser.Tokens.Sino.rawValue)
		 	setState(235)
		 	try match(OnlyLonelyParser.Tokens.AbreLlave.rawValue)
		 	setState(236)
		 	try cuerpo()
		 	setState(237)
		 	try match(OnlyLonelyParser.Tokens.CierraLlave.rawValue)


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TMientrasContext: ParserRuleContext {
			open
			func Mientras() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Mientras.rawValue, 0)
			}
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
			open
			func Hacer() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Hacer.rawValue, 0)
			}
			open
			func AbreLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreLlave.rawValue, 0)
			}
			open
			func cuerpo() -> CuerpoContext? {
				return getRuleContext(CuerpoContext.self, 0)
			}
			open
			func CierraLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraLlave.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_tMientras
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTMientras(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTMientras(self)
			}
		}
	}
	@discardableResult
	 open func tMientras() throws -> TMientrasContext {
        let _localctx: TMientrasContext = TMientrasContext(_ctx, getState())
		try enterRule(_localctx, 42, OnlyLonelyParser.RULE_tMientras)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(239)
		 	try match(OnlyLonelyParser.Tokens.Mientras.rawValue)
		 	setState(240)
		 	try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 	setState(241)
		 	try exp()
		 	setState(242)
		 	try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)
		 	setState(243)
		 	try match(OnlyLonelyParser.Tokens.Hacer.rawValue)
		 	setState(244)
		 	try match(OnlyLonelyParser.Tokens.AbreLlave.rawValue)
		 	setState(245)
		 	try cuerpo()
		 	setState(246)
		 	try match(OnlyLonelyParser.Tokens.CierraLlave.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TDesdeContext: ParserRuleContext {
			open
			func Desde() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Desde.rawValue, 0)
			}
			open
			func Id() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Id.rawValue, 0)
			}
			open
			func Asignacion() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Asignacion.rawValue, 0)
			}
			open
			func exp() -> [ExpContext] {
				return getRuleContexts(ExpContext.self)
			}
			open
			func exp(_ i: Int) -> ExpContext? {
				return getRuleContext(ExpContext.self, i)
			}
			open
			func Hasta() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Hasta.rawValue, 0)
			}
			open
			func Hacer() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Hacer.rawValue, 0)
			}
			open
			func AbreLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreLlave.rawValue, 0)
			}
			open
			func cuerpo() -> CuerpoContext? {
				return getRuleContext(CuerpoContext.self, 0)
			}
			open
			func CierraLlave() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraLlave.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_tDesde
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTDesde(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTDesde(self)
			}
		}
	}
	@discardableResult
	 open func tDesde() throws -> TDesdeContext {
        let _localctx: TDesdeContext = TDesdeContext(_ctx, getState())
		try enterRule(_localctx, 44, OnlyLonelyParser.RULE_tDesde)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(248)
		 	try match(OnlyLonelyParser.Tokens.Desde.rawValue)
		 	setState(249)
		 	try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 	setState(250)
		 	try match(OnlyLonelyParser.Tokens.Asignacion.rawValue)
		 	setState(251)
		 	try exp()
		 	setState(252)
		 	try match(OnlyLonelyParser.Tokens.Hasta.rawValue)
		 	setState(253)
		 	try exp()
		 	setState(254)
		 	try match(OnlyLonelyParser.Tokens.Hacer.rawValue)
		 	setState(255)
		 	try match(OnlyLonelyParser.Tokens.AbreLlave.rawValue)
		 	setState(256)
		 	try cuerpo()
		 	setState(257)
		 	try match(OnlyLonelyParser.Tokens.CierraLlave.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpContext: ParserRuleContext {
			open
			func expRel() -> ExpRelContext? {
				return getRuleContext(ExpRelContext.self, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func TokenOr() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.TokenOr.rawValue, 0)
			}
			open
			func TokenAnd() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.TokenAnd.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_exp
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterExp(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitExp(self)
			}
		}
	}
	@discardableResult
	 open func exp() throws -> ExpContext {
        let _localctx: ExpContext = ExpContext(_ctx, getState())
		try enterRule(_localctx, 46, OnlyLonelyParser.RULE_exp)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(264)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,13, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(259)
		 		try expRel()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(260)
		 		try expRel()
		 		setState(261)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == OnlyLonelyParser.Tokens.TokenOr.rawValue || _la == OnlyLonelyParser.Tokens.TokenAnd.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(262)
		 		try exp()


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpRelContext: ParserRuleContext {
			open
			func expArit() -> ExpAritContext? {
				return getRuleContext(ExpAritContext.self, 0)
			}
			open
			func expRel() -> ExpRelContext? {
				return getRuleContext(ExpRelContext.self, 0)
			}
			open
			func MayorQue() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.MayorQue.rawValue, 0)
			}
			open
			func MenorQue() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.MenorQue.rawValue, 0)
			}
			open
			func IgualQue() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.IgualQue.rawValue, 0)
			}
			open
			func DiferenteQue() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.DiferenteQue.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_expRel
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterExpRel(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitExpRel(self)
			}
		}
	}
	@discardableResult
	 open func expRel() throws -> ExpRelContext {
        let _localctx: ExpRelContext = ExpRelContext(_ctx, getState())
		try enterRule(_localctx, 48, OnlyLonelyParser.RULE_expRel)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(271)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,14, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(266)
		 		try expArit()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(267)
		 		try expArit()
		 		setState(268)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = {  () -> Bool in
		 		   let testArray: [Int] = [_la, OnlyLonelyParser.Tokens.MayorQue.rawValue,OnlyLonelyParser.Tokens.MenorQue.rawValue,OnlyLonelyParser.Tokens.IgualQue.rawValue,OnlyLonelyParser.Tokens.DiferenteQue.rawValue]
		 		    return  Utils.testBitLeftShiftArray(testArray, 0)
		 		}()
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(269)
		 		try expRel()


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpAritContext: ParserRuleContext {
			open
			func termino() -> TerminoContext? {
				return getRuleContext(TerminoContext.self, 0)
			}
			open
			func expArit() -> ExpAritContext? {
				return getRuleContext(ExpAritContext.self, 0)
			}
			open
			func Suma() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Suma.rawValue, 0)
			}
			open
			func Resta() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Resta.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_expArit
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterExpArit(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitExpArit(self)
			}
		}
	}
	@discardableResult
	 open func expArit() throws -> ExpAritContext {
        let _localctx: ExpAritContext = ExpAritContext(_ctx, getState())
		try enterRule(_localctx, 50, OnlyLonelyParser.RULE_expArit)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(278)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,15, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(273)
		 		try termino()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(274)
		 		try termino()
		 		setState(275)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == OnlyLonelyParser.Tokens.Suma.rawValue || _la == OnlyLonelyParser.Tokens.Resta.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(276)
		 		try expArit()


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TerminoContext: ParserRuleContext {
			open
			func factor() -> FactorContext? {
				return getRuleContext(FactorContext.self, 0)
			}
			open
			func termino() -> TerminoContext? {
				return getRuleContext(TerminoContext.self, 0)
			}
			open
			func Multiplicacion() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Multiplicacion.rawValue, 0)
			}
			open
			func Division() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Division.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_termino
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterTermino(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitTermino(self)
			}
		}
	}
	@discardableResult
	 open func termino() throws -> TerminoContext {
        let _localctx: TerminoContext = TerminoContext(_ctx, getState())
		try enterRule(_localctx, 52, OnlyLonelyParser.RULE_termino)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(285)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,16, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(280)
		 		try factor()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(281)
		 		try factor()
		 		setState(282)
		 		_la = try _input.LA(1)
		 		if (!(//closure
		 		 { () -> Bool in
		 		      let testSet: Bool = _la == OnlyLonelyParser.Tokens.Multiplicacion.rawValue || _la == OnlyLonelyParser.Tokens.Division.rawValue
		 		      return testSet
		 		 }())) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(283)
		 		try termino()


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FactorContext: ParserRuleContext {
			open
			func Id() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Id.rawValue, 0)
			}
			open
			func AbreCorchete() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreCorchete.rawValue, 0)
			}
			open
			func exp() -> ExpContext? {
				return getRuleContext(ExpContext.self, 0)
			}
			open
			func CierraCorchete() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraCorchete.rawValue, 0)
			}
			open
			func NumFlotante() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.NumFlotante.rawValue, 0)
			}
			open
			func Numero() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.Numero.rawValue, 0)
			}
			open
			func AbreParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.AbreParentesis.rawValue, 0)
			}
			open
			func CierraParentesis() -> TerminalNode? {
				return getToken(OnlyLonelyParser.Tokens.CierraParentesis.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return OnlyLonelyParser.RULE_factor
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.enterFactor(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? OnlyLonelyListener {
				listener.exitFactor(self)
			}
		}
	}
	@discardableResult
	 open func factor() throws -> FactorContext {
        let _localctx: FactorContext = FactorContext(_ctx, getState())
		try enterRule(_localctx, 54, OnlyLonelyParser.RULE_factor)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(299)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,17, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(287)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(288)
		 		try match(OnlyLonelyParser.Tokens.Id.rawValue)
		 		setState(289)
		 		try match(OnlyLonelyParser.Tokens.AbreCorchete.rawValue)
		 		setState(290)
		 		try exp()
		 		setState(291)
		 		try match(OnlyLonelyParser.Tokens.CierraCorchete.rawValue)


		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(293)
		 		try match(OnlyLonelyParser.Tokens.NumFlotante.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(294)
		 		try match(OnlyLonelyParser.Tokens.Numero.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(295)
		 		try match(OnlyLonelyParser.Tokens.AbreParentesis.rawValue)
		 		setState(296)
		 		try exp()
		 		setState(297)
		 		try match(OnlyLonelyParser.Tokens.CierraParentesis.rawValue)


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public
	static let _serializedATN = OnlyLonelyParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}
