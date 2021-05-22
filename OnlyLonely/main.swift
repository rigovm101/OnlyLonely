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
a,b,c : entero;
i : flotante;

entero funcion miFunc()
variables miVar : entero;{
b = miFunc() + 2;
regresa(a);
}

principal(){
a = miFunc() + 12;
}
"""

let inputStream = ANTLRInputStream(input)
let lexer = OnlyLonelyLexer(inputStream)
let tokenStream = CommonTokenStream(lexer)

let parser = try OnlyLonelyParser(tokenStream)
let myListener = MyCustomListener()
parser.addParseListener(myListener)
let expressionContext = try parser.root()
