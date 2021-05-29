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

entero funcion funcFibo(i : entero){
si (i < 2) entonces{
regresa(i);
}sino{
regresa(funcFibo(i - 1) + funcFibo(i - 2));
}
}

entero funcion factorial(i : entero){
si (i == 0) entonces{
regresa(1);
}sino{
regresa(i * factorial(i - 1));
}

}

principal(){

escribe(factorial(5), "a dormir");
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
virtualMachine.run()
