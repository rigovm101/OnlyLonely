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
variables i[2][2], j[2][2], k[2][2] : entero;

principal(){
i[0][0] = 6;
i[0][1] = 1;
i[1][0] = 2;
i[1][1] = 6;

j[0][0] = 2;
j[0][1] = 9;
j[1][0] = 2;
j[1][1] = 2;

k[0][0] = 0;
k[0][1] = 0;
k[1][0] = 0;
k[1][1] = 0;

desde a = 0 hasta 2 hacer{
desde b = 0 hasta 2 hacer{
desde c = 0 hasta 2 hacer{
k[a][b] = i[a][c] * j[c][b] + k[a][b];
}
}
}

escribe(k[0][0], k[0][1], k[1][0], k[1][1]);

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
