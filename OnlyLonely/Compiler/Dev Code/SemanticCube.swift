//
//  SemanticCube.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 30/04/21.
//

class SemanticCube {
    
    var cube : [String : [String : [String : String]]]

    init() {
        cube = [String : [String : [String : String]]]()
        
        //Initialization
        cube["entero"] = [String:[String:String]]()
        cube["flotante"] = [String:[String:String]]()
        cube["char"] = [String:[String:String]]()
        
        cube["entero"]!["entero"] = [String:String]()
        cube["entero"]!["flotante"] = [String:String]()
        cube["entero"]!["char"] = [String:String]()
        
        cube["flotante"]!["entero"] = [String:String]()
        cube["flotante"]!["flotante"] = [String:String]()
        cube["flotante"]!["char"] = [String:String]()
        
        cube["char"]!["entero"] = [String:String]()
        cube["char"]!["flotante"] = [String:String]()
        cube["char"]!["char"] = [String:String]()
        
        //Entero Entero
        cube["entero"]!["entero"]!["+"] = "entero"
        cube["entero"]!["entero"]!["-"] = "entero"
        cube["entero"]!["entero"]!["*"] = "entero"
        cube["entero"]!["entero"]!["/"] = "flotante"
        cube["entero"]!["entero"]![">"] = "bool"
        cube["entero"]!["entero"]!["<"] = "bool"
        cube["entero"]!["entero"]!["=="] = "bool"
        cube["entero"]!["entero"]!["&"] = "bool"
        cube["entero"]!["entero"]!["|"] = "bool"
        cube["entero"]!["entero"]!["="] = "entero"
        
        //Entero Flotante
        cube["entero"]!["flotante"]!["+"] = "flotante"
        cube["entero"]!["flotante"]!["-"] = "flotante"
        cube["entero"]!["flotante"]!["*"] = "flotante"
        cube["entero"]!["flotante"]!["/"] = "flotante"
        cube["entero"]!["flotante"]![">"] = "bool"
        cube["entero"]!["flotante"]!["<"] = "bool"
        cube["entero"]!["flotante"]!["=="] = "bool"
        cube["entero"]!["flotante"]!["&"] = "bool"
        cube["entero"]!["flotante"]!["|"] = "bool"
        cube["entero"]!["flotante"]!["="] = "flotante"
        
        cube["flotante"]!["entero"]!["+"] = "flotante"
        cube["flotante"]!["entero"]!["-"] = "flotante"
        cube["flotante"]!["entero"]!["*"] = "flotante"
        cube["flotante"]!["entero"]!["/"] = "flotante"
        cube["flotante"]!["entero"]![">"] = "bool"
        cube["flotante"]!["entero"]!["<"] = "bool"
        cube["flotante"]!["entero"]!["=="] = "bool"
        cube["flotante"]!["entero"]!["&"] = "bool"
        cube["flotante"]!["entero"]!["|"] = "bool"
        cube["flotante"]!["entero"]!["="] = "flotante"
        
        //Entero Char
        cube["entero"]!["char"]!["+"] = nil
        cube["entero"]!["char"]!["-"] = nil
        cube["entero"]!["char"]!["*"] = nil
        cube["entero"]!["char"]!["/"] = nil
        cube["entero"]!["char"]![">"] = nil
        cube["entero"]!["char"]!["<"] = nil
        cube["entero"]!["char"]!["=="] = nil
        cube["entero"]!["char"]!["&"] = nil
        cube["entero"]!["char"]!["|"] = nil
        cube["entero"]!["char"]!["="] = nil
        
        cube["char"]!["entero"]!["+"] = nil
        cube["char"]!["entero"]!["-"] = nil
        cube["char"]!["entero"]!["*"] = nil
        cube["char"]!["entero"]!["/"] = nil
        cube["char"]!["entero"]![">"] = nil
        cube["char"]!["entero"]!["<"] = nil
        cube["char"]!["entero"]!["=="] = nil
        cube["char"]!["entero"]!["&"] = nil
        cube["char"]!["entero"]!["|"] = nil
        cube["char"]!["entero"]!["="] = nil
        
        //Flotante Flotante
        cube["flotante"]!["flotante"]!["+"] = "flotante"
        cube["flotante"]!["flotante"]!["-"] = "flotante"
        cube["flotante"]!["flotante"]!["*"] = "flotante"
        cube["flotante"]!["flotante"]!["/"] = "flotante"
        cube["flotante"]!["flotante"]![">"] = "bool"
        cube["flotante"]!["flotante"]!["<"] = "bool"
        cube["flotante"]!["flotante"]!["=="] = "bool"
        cube["flotante"]!["flotante"]!["&"] = "bool"
        cube["flotante"]!["flotante"]!["|"] = "bool"
        cube["flotante"]!["flotante"]!["="] = "flotante"
        
        //Flotante Char
        cube["flotante"]!["char"]!["+"] = nil
        cube["flotante"]!["char"]!["-"] = nil
        cube["flotante"]!["char"]!["*"] = nil
        cube["flotante"]!["char"]!["/"] = nil
        cube["flotante"]!["char"]![">"] = nil
        cube["flotante"]!["char"]!["<"] = nil
        cube["flotante"]!["char"]!["=="] = nil
        cube["flotante"]!["char"]!["&"] = nil
        cube["flotante"]!["char"]!["|"] = nil
        cube["flotante"]!["char"]!["="] = nil
        
        cube["char"]!["flotante"]!["+"] = nil
        cube["char"]!["flotante"]!["-"] = nil
        cube["char"]!["flotante"]!["*"] = nil
        cube["char"]!["flotante"]!["/"] = nil
        cube["char"]!["flotante"]![">"] = nil
        cube["char"]!["flotante"]!["<"] = nil
        cube["char"]!["flotante"]!["=="] = nil
        cube["char"]!["flotante"]!["&"] = nil
        cube["char"]!["flotante"]!["|"] = nil
        cube["char"]!["flotante"]!["="] = nil
        
        //Char Char
        cube["char"]!["char"]!["+"] = nil
        cube["char"]!["char"]!["-"] = nil
        cube["char"]!["char"]!["*"] = nil
        cube["char"]!["char"]!["/"] = nil
        cube["char"]!["char"]![">"] = nil
        cube["char"]!["char"]!["<"] = nil
        cube["char"]!["char"]!["=="] = "bool"
        cube["char"]!["char"]!["&"] = nil
        cube["char"]!["char"]!["|"] = nil
        cube["char"]!["char"]!["="] = "char"
    }
    
    func chekCube(leftType:String, rightType: String, myOperator: String) -> String? {
        return cube[leftType]![rightType]![myOperator]
    }
}
