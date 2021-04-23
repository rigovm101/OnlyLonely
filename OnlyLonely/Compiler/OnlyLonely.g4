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

tFuncion : tipoRet Funcion (Id | IdFunc) AbreParentesis parametros CierraParentesis decVar AbreLlave cuerpo CierraLlave;

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

estDesicion : (Si AbreParentesis exp CierraParentesis Entonces AbreLlave cuerpo CierraLlave tSino) | (Si AbreParentesis exp CierraParentesis Entonces AbreLlave cuerpo CierraLlave);

tSino : (Sino AbreLlave cuerpo CierraLlave);

tMientras : Mientras AbreParentesis exp CierraParentesis Hacer AbreLlave cuerpo CierraLlave;

tDesde : Desde Id Asignacion exp Hasta exp Hacer AbreLlave cuerpo CierraLlave;

exp : expRel | (expRel (TokenOr | TokenAnd) exp);

expRel : expArit | (expArit (MayorQue | MenorQue | IgualQue | DiferenteQue) expRel);

expArit : termino | (termino (Suma | Resta) expArit);

termino : factor | (factor (Multiplicacion | Division) termino);

factor : Id | (Id AbreCorchete exp CierraCorchete) | NumFlotante | Numero | (AbreParentesis exp CierraParentesis);
