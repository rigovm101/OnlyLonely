// Generated from OnlyLonely.g4 by ANTLR 4.9
import Antlr4

open class OnlyLonelyLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = OnlyLonelyLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(OnlyLonelyLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let Programa=1, Variables=2, Funcion=3, Void=4, Entero=5, Flotante=6, 
            Char=7, Regresa=8, Lee=9, Escribe=10, Si=11, Entonces=12, Sino=13, 
            Principal=14, Mientras=15, Hacer=16, Desde=17, Hasta=18, TokenOr=19, 
            TokenAnd=20, MayorQue=21, MenorQue=22, Asignacion=23, IgualQue=24, 
            DiferenteQue=25, Suma=26, Resta=27, Multiplicacion=28, Division=29, 
            AbreParentesis=30, CierraParentesis=31, AbreLlave=32, CierraLlave=33, 
            AbreCorchete=34, CierraCorchete=35, DosPuntos=36, PuntoComa=37, 
            Coma=38, Numero=39, NumFlotante=40, String=41, Id=42, WS=43

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"Programa", "Variables", "Funcion", "Void", "Entero", "Flotante", "Char", 
		"Regresa", "Lee", "Escribe", "Si", "Entonces", "Sino", "Principal", "Mientras", 
		"Hacer", "Desde", "Hasta", "TokenOr", "TokenAnd", "MayorQue", "MenorQue", 
		"Asignacion", "IgualQue", "DiferenteQue", "Suma", "Resta", "Multiplicacion", 
		"Division", "AbreParentesis", "CierraParentesis", "AbreLlave", "CierraLlave", 
		"AbreCorchete", "CierraCorchete", "DosPuntos", "PuntoComa", "Coma", "Numero", 
		"NumFlotante", "String", "Id", "WS"
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
		"Coma", "Numero", "NumFlotante", "String", "Id", "WS"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)


	override open
	func getVocabulary() -> Vocabulary {
		return OnlyLonelyLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.9", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, OnlyLonelyLexer._ATN, OnlyLonelyLexer._decisionToDFA, OnlyLonelyLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "OnlyLonely.g4" }

	override open
	func getRuleNames() -> [String] { return OnlyLonelyLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return OnlyLonelyLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return OnlyLonelyLexer.channelNames }

	override open
	func getModeNames() -> [String] { return OnlyLonelyLexer.modeNames }

	override open
	func getATN() -> ATN { return OnlyLonelyLexer._ATN }


	public
	static let _serializedATN: String = OnlyLonelyLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}