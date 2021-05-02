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
Numero : [0-9]+;
NumFlotante : Numero'.'[0-9]+;
String : '"'([a-z]|[A-Z]|[0-9]|[ ])*'"';
Id : [a-z]([a-z]|[A-Z]|[0-9])*;
IdFunc : [A-Z]([a-z]|[A-Z]|[0-9])*;
WS : [ \t\r\n]+ -> skip;

root : Programa IdFunc PuntoComa decVar decFunc tPrincipal;

decVar : Variables listaVTipo |;

listaVTipo : (listaIds DosPuntos tipo PuntoComa listaVTipo) | (listaIds DosPuntos tipo PuntoComa);

listaIds : variable | (variable Coma listaIds);

variable : Id | (Id AbreCorchete exp CierraCorchete);

decFunc : tFuncion*;

tFuncion : tipoRet Funcion (Id | IdFunc) AbreParentesis parametros CierraParentesis decVarLocal AbreLlave cuerpo CierraLlave;

decVarLocal : Variables listaVTipo |;

cuerpo : estatuto*;

parametros : (Id DosPuntos tipo) | (Id DosPuntos tipo Coma parametros) |;

tPrincipal : Principal AbreParentesis CierraParentesis AbreLlave cuerpo CierraLlave;

tipoRet : Void | Entero | Flotante | Char;

tipo : Entero | Flotante | Char;

estatuto : tAsignacion | retornoFunc | lectura | escritura | estDesicion | tMientras | tDesde;

tAsignacion : (Id Asignacion exp PuntoComa) | (Id AbreCorchete exp CierraCorchete Asignacion exp PuntoComa) | (Id Asignacion IdFunc PuntoComa);

llamadaVoid : ((Id | IdFunc) AbreParentesis CierraParentesis PuntoComa) | ((Id | IdFunc) AbreParentesis argumentos CierraParentesis PuntoComa);

argumentos : Id | (Id Coma argumentos);

retornoFunc : Regresa AbreParentesis exp CierraParentesis PuntoComa;

lectura : Lee AbreParentesis argumentos CierraParentesis PuntoComa;

escritura : (Escribe AbreParentesis exp CierraParentesis PuntoComa) | (Escribe AbreParentesis String CierraParentesis PuntoComa);

estDesicion : (Si AbreParentesis exp CierraParentesis Entonces AbreLlave cuerpo CierraLlave tSino) | (Si AbreParentesis exp {myListener.saveJumpPoint()} CierraParentesis Entonces AbreLlave cuerpo CierraLlave {myListener.writeSavePoint()});

tSino : (Sino AbreLlave cuerpo CierraLlave);

tMientras : Mientras AbreParentesis exp CierraParentesis Hacer AbreLlave cuerpo CierraLlave;

tDesde : Desde Id Asignacion exp Hasta exp Hacer AbreLlave cuerpo CierraLlave;

exp : expRel | (expRel (TokenOr {myListener.foundTokenOr()} | TokenAnd {myListener.foundTokenAnd()}) exp);

expRel : expArit | (expArit (MayorQue {myListener.foundMayorQue()} | MenorQue {myListener.foundMenorQue()} | IgualQue {myListener.foundIgualQue()}| DiferenteQue {myListener.foundDiferenteQue()}) expRel);

expArit : termino | (termino (Suma {myListener.foundSuma()} | Resta {myListener.foundResta()}) expArit);

termino : factor | (factor (Multiplicacion {myListener.foundMultiplicacion()} | Division {myListener.foundDivision()}) termino);

factor : Id | (Id AbreCorchete exp CierraCorchete) | NumFlotante | Numero | (AbreParentesis {myListener.foundAbreParentesis()} exp CierraParentesis {myListener.foundCierraParentesis()});
