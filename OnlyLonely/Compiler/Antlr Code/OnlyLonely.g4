grammar OnlyLonely;
Programa : 'programa';
Variables : 'variables';
Funcion : 'funcion';
Void : 'void';
Entero : 'entero';
Flotante : 'flotante';
Char : 'char';
Regresa : 'regresa';
Lee : 'lee';
Escribe : 'escribe';
Si : 'si';
Entonces : 'entonces';
Sino : 'sino';
Principal : 'principal';
Mientras : 'mientras';
Hacer : 'hacer';
Desde : 'desde';
Hasta : 'hasta';
TokenOr : '|';
TokenAnd : '&';
MayorQue : '>';
MenorQue : '<';
Asignacion : '=';
IgualQue : '==';
DiferenteQue : '!=';
Suma : '+';
Resta : '-';
Multiplicacion : '*';
Division : '/';
AbreParentesis : '(';
CierraParentesis : ')';
AbreLlave : '{';
CierraLlave : '}';
AbreCorchete : '[';
CierraCorchete : ']';
DosPuntos : ':';
PuntoComa : ';';
Coma : ',';
Numero : '-'?[0-9]+;
NumFlotante : Numero'.'[0-9]+;
Caracter : '"'([a-z]|[A-Z])'"';
String : '"'([a-z]|[A-Z]|[0-9]|[ ])*'"';
Id : [a-z]([a-z]|[A-Z]|[0-9])*;
WS : [ \t\r\n]+ -> skip;

root : Programa Id PuntoComa decVar decFunc tPrincipal;

decVar : Variables listaVTipo |;

listaVTipo : (listaIds DosPuntos tipo PuntoComa listaVTipo) | (listaIds DosPuntos tipo PuntoComa);

listaIds : variable | (variable Coma listaIds);

variable : (Id AbreCorchete Numero {myListener.createArray($Numero.text , $Id.text)} CierraCorchete) | Id;

decFunc : tFuncion*;

tFuncion : tipoRet Funcion Id {myListener.saveFunctionName($Id.text , $tipoRet.text)} AbreParentesis parametros CierraParentesis decVarLocal {myListener.saveFuncStartingPoint()} AbreLlave cuerpo {myListener.checkIfReturn()} CierraLlave;

decVarLocal : Variables listaVTipo |;

cuerpo : estatuto*;

parametros : (Id DosPuntos tipo {myListener.saveParameter($Id.text , $tipo.text)}) | (Id DosPuntos tipo {myListener.saveParameter($Id.text , $tipo.text)} Coma parametros) |;

tPrincipal : Principal AbreParentesis CierraParentesis AbreLlave cuerpo CierraLlave;

tipoRet : Void | Entero | Flotante | Char;

tipo : Entero | Flotante | Char;

estatuto : tAsignacion | retornoFunc | lectura | escritura | estDesicion | tMientras | tDesde | llamadaVoid;

lectura : Lee AbreParentesis argumentos CierraParentesis PuntoComa;

escritura : (Escribe AbreParentesis escrituraAux CierraParentesis PuntoComa);

escrituraAux : ((exp | String) Coma escrituraAux) | (exp | String) |;

tAsignacion : (Id {myListener.checkIsNotArray($Id.text)} Asignacion exp PuntoComa) | (Id AbreCorchete exp {myListener.verifyArray($Id.text)} CierraCorchete Asignacion exp PuntoComa);

llamadaVoid : (Id {myListener.verifyFuncExists($Id.text)} AbreParentesis {myListener.generateEra($Id.text)} argumentos CierraParentesis PuntoComa);

llamada : (Id {myListener.verifyNoVoidFuncExists($Id.text)} AbreParentesis {myListener.generateEra($Id.text)} argumentos CierraParentesis);

argumentos : exp {myListener.processArgument()} | (exp {myListener.processArgument()} Coma argumentos) |;

retornoFunc : Regresa AbreParentesis exp CierraParentesis PuntoComa;

estDesicion : (Si AbreParentesis exp {myListener.saveJumpPoint()} CierraParentesis Entonces AbreLlave cuerpo CierraLlave {myListener.writeElseSavePoint()} tSino) | (Si AbreParentesis exp {myListener.saveJumpPoint()} CierraParentesis Entonces AbreLlave cuerpo CierraLlave {myListener.writeSavePoint()});

tSino : (Sino AbreLlave cuerpo CierraLlave {myListener.writeSavePoint()});

tMientras : Mientras AbreParentesis {myListener.saveWhileCondStart()} exp CierraParentesis Hacer AbreLlave {myListener.saveWhileBodyStart()} cuerpo CierraLlave {myListener.saveWhileBodyEnd()};

tDesde : Desde Id Asignacion exp {myListener.varDeclarationForLoop($Id.text)} Hasta exp {myListener.conditionForLoop()} Hacer AbreLlave cuerpo CierraLlave {myListener.endForLoop($Id.text)};

exp : expRel | (expRel (TokenOr {myListener.foundTokenOr()} | TokenAnd {myListener.foundTokenAnd()}) exp);

expRel : expArit | (expArit (MayorQue {myListener.foundMayorQue()} | MenorQue {myListener.foundMenorQue()} | IgualQue {myListener.foundIgualQue()}| DiferenteQue {myListener.foundDiferenteQue()}) expRel);

expArit : termino | (termino (Suma {myListener.foundSuma()} | Resta {myListener.foundResta()}) expArit);

termino : factor | (factor (Multiplicacion {myListener.foundMultiplicacion()} | Division {myListener.foundDivision()}) termino);

factor : llamada | (Id AbreCorchete {myListener.prepareArrayAccess()} exp {myListener.verifyArray($Id.text)} CierraCorchete) | Id | NumFlotante | Numero | Caracter | (AbreParentesis {myListener.foundAbreParentesis()} exp CierraParentesis {myListener.foundCierraParentesis()});
