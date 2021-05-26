//
//  main.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 23/04/21.
//

import Foundation
import Antlr4

let input = """
programa theOnlyLonely;
variables
i,j,p : entero;
valor : flotante;

entero funcion fact (j : entero)
variables i, arr[10] : entero;
{
i = j + (p - j * 2 + j);
si (j == 1) entonces {
regresa(j + arr[21]);}
sino
{regresa (j * fact(j-1+arr[2]));}
}

principal(){
mientras (i < 10 * 1.1) hacer{
p = fact(j);
}
}
"""

let inputStream = ANTLRInputStream(input)
let lexer = OnlyLonelyLexer(inputStream)
let tokenStream = CommonTokenStream(lexer)

let parser = try OnlyLonelyParser(tokenStream)
let myListener = MyCustomListener()
parser.addParseListener(myListener)
let expressionContext = try parser.root()

let virtualMachine = VirtualMachine(myListener.getFunctionTable(), myListener.getConstTable(), myListener.getQuadruples())
