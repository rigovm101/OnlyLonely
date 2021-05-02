//
//  main.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 23/04/21.
//

import Foundation
import Antlr4

let input = """
programa TheOnlyLonely;
variables
a,b,c,d,e,f,g : entero;
h,i,j,k : flotante;
miChar : char;

entero funcion fact(j:entero)
variables x : entero;
{

}

principal(){
si(a)entonces{
a = b + c;
}
b = c + d;
}
"""

let inputStream = ANTLRInputStream(input)
let lexer = OnlyLonelyLexer(inputStream)
let tokenStream = CommonTokenStream(lexer)

let parser = try OnlyLonelyParser(tokenStream)
let myListener = MyCustomListener()
parser.addParseListener(myListener)
let expressionContext = try parser.root()
