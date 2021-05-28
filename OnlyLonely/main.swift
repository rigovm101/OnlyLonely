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

principal(){

desde f = 0 hasta 10 hacer{
escribe(f);
}
escribe(99 / 23 + 1);
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
