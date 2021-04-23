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
i,j,p : entero;
valor : flotante;

entero funcion fact(j:entero)
variables i : entero;
{

}

principal(){
escribe(2);
}
"""

let inputStream = ANTLRInputStream(input)
let lexer = OnlyLonelyLexer(inputStream)
let tokenStream = CommonTokenStream(lexer)

let parser = try OnlyLonelyParser(tokenStream)
let expressionContext = try parser.root()

print(expressionContext.toStringTree(parser))
