//
//  SemanticCube.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 30/04/21.
//

/// Semantic Cube
/// - Description: This class is used in compilation to check which types are compatible with one another in compilation
class SemanticCube {
    
    var cube : [String : [String : [String : String]]]
    
    /// Semantic Cube Initializer
    /// - Description: The Semantic Cube is initialized with the information of all the data types
    init() {
        cube = [String : [String : [String : String]]]()
        
        //Initialization
        cube["entero"] = [String:[String:String]]()
        cube["flotante"] = [String:[String:String]]()
        cube["char"] = [String:[String:String]]()
        cube["bool"] = [String:[String:String]]()
        
        cube["entero"]!["entero"] = [String:String]()
        cube["entero"]!["flotante"] = [String:String]()
        cube["entero"]!["char"] = [String:String]()
        cube["entero"]!["bool"] = [String:String]()
        
        cube["flotante"]!["entero"] = [String:String]()
        cube["flotante"]!["flotante"] = [String:String]()
        cube["flotante"]!["char"] = [String:String]()
        cube["flotante"]!["bool"] = [String:String]()
        
        cube["char"]!["entero"] = [String:String]()
        cube["char"]!["flotante"] = [String:String]()
        cube["char"]!["char"] = [String:String]()
        cube["char"]!["bool"] = [String:String]()
        
        cube["bool"]!["entero"] = [String:String]()
        cube["bool"]!["flotante"] = [String:String]()
        cube["bool"]!["char"] = [String:String]()
        cube["bool"]!["bool"] = [String:String]()
        
        //Entero Entero
        cube["entero"]!["entero"]!["+"] = "entero"
        cube["entero"]!["entero"]!["-"] = "entero"
        cube["entero"]!["entero"]!["*"] = "entero"
        cube["entero"]!["entero"]!["/"] = "flotante"
        cube["entero"]!["entero"]![">"] = "bool"
        cube["entero"]!["entero"]!["<"] = "bool"
        cube["entero"]!["entero"]!["=="] = "bool"
        cube["entero"]!["entero"]!["!="] = "bool"
        cube["entero"]!["entero"]!["&"] = nil
        cube["entero"]!["entero"]!["|"] = nil
        cube["entero"]!["entero"]!["="] = "entero"
        
        //Entero Flotante
        cube["entero"]!["flotante"]!["+"] = "flotante"
        cube["entero"]!["flotante"]!["-"] = "flotante"
        cube["entero"]!["flotante"]!["*"] = "flotante"
        cube["entero"]!["flotante"]!["/"] = "flotante"
        cube["entero"]!["flotante"]![">"] = "bool"
        cube["entero"]!["flotante"]!["<"] = "bool"
        cube["entero"]!["flotante"]!["=="] = "bool"
        cube["entero"]!["flotante"]!["!="] = "bool"
        cube["entero"]!["flotante"]!["&"] = nil
        cube["entero"]!["flotante"]!["|"] = nil
        cube["entero"]!["flotante"]!["="] = "flotante"
        
        cube["flotante"]!["entero"]!["+"] = "flotante"
        cube["flotante"]!["entero"]!["-"] = "flotante"
        cube["flotante"]!["entero"]!["*"] = "flotante"
        cube["flotante"]!["entero"]!["/"] = "flotante"
        cube["flotante"]!["entero"]![">"] = "bool"
        cube["flotante"]!["entero"]!["<"] = "bool"
        cube["flotante"]!["entero"]!["=="] = "bool"
        cube["flotante"]!["entero"]!["!="] = "bool"
        cube["flotante"]!["entero"]!["&"] = nil
        cube["flotante"]!["entero"]!["|"] = nil
        cube["flotante"]!["entero"]!["="] = "flotante"
        
        //Entero Char
        cube["entero"]!["char"]!["+"] = nil
        cube["entero"]!["char"]!["-"] = nil
        cube["entero"]!["char"]!["*"] = nil
        cube["entero"]!["char"]!["/"] = nil
        cube["entero"]!["char"]![">"] = nil
        cube["entero"]!["char"]!["<"] = nil
        cube["entero"]!["char"]!["=="] = nil
        cube["entero"]!["char"]!["!="] = nil
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
        cube["char"]!["entero"]!["!="] = nil
        cube["char"]!["entero"]!["&"] = nil
        cube["char"]!["entero"]!["|"] = nil
        cube["char"]!["entero"]!["="] = nil
        
        //Entero Bool
        cube["entero"]!["bool"]!["+"] = nil
        cube["entero"]!["bool"]!["-"] = nil
        cube["entero"]!["bool"]!["*"] = nil
        cube["entero"]!["bool"]!["/"] = nil
        cube["entero"]!["bool"]![">"] = nil
        cube["entero"]!["bool"]!["<"] = nil
        cube["entero"]!["bool"]!["=="] = nil
        cube["entero"]!["bool"]!["!="] = nil
        cube["entero"]!["bool"]!["&"] = nil
        cube["entero"]!["bool"]!["|"] = nil
        cube["entero"]!["bool"]!["="] = nil
        
        cube["bool"]!["entero"]!["+"] = nil
        cube["bool"]!["entero"]!["-"] = nil
        cube["bool"]!["entero"]!["*"] = nil
        cube["bool"]!["entero"]!["/"] = nil
        cube["bool"]!["entero"]![">"] = nil
        cube["bool"]!["entero"]!["<"] = nil
        cube["bool"]!["entero"]!["=="] = nil
        cube["bool"]!["entero"]!["!="] = nil
        cube["bool"]!["entero"]!["&"] = nil
        cube["bool"]!["entero"]!["|"] = nil
        cube["bool"]!["entero"]!["="] = nil
        
        //Flotante Flotante
        cube["flotante"]!["flotante"]!["+"] = "flotante"
        cube["flotante"]!["flotante"]!["-"] = "flotante"
        cube["flotante"]!["flotante"]!["*"] = "flotante"
        cube["flotante"]!["flotante"]!["/"] = "flotante"
        cube["flotante"]!["flotante"]![">"] = "bool"
        cube["flotante"]!["flotante"]!["<"] = "bool"
        cube["flotante"]!["flotante"]!["=="] = "bool"
        cube["flotante"]!["flotante"]!["!="] = "bool"
        cube["flotante"]!["flotante"]!["&"] = nil
        cube["flotante"]!["flotante"]!["|"] = nil
        cube["flotante"]!["flotante"]!["="] = "flotante"
        
        //Flotante Char
        cube["flotante"]!["char"]!["+"] = nil
        cube["flotante"]!["char"]!["-"] = nil
        cube["flotante"]!["char"]!["*"] = nil
        cube["flotante"]!["char"]!["/"] = nil
        cube["flotante"]!["char"]![">"] = nil
        cube["flotante"]!["char"]!["<"] = nil
        cube["flotante"]!["char"]!["=="] = nil
        cube["flotante"]!["char"]!["!="] = nil
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
        cube["char"]!["flotante"]!["!="] = nil
        cube["char"]!["flotante"]!["&"] = nil
        cube["char"]!["flotante"]!["|"] = nil
        cube["char"]!["flotante"]!["="] = nil
        
        //Flotante Bool
        cube["flotante"]!["bool"]!["+"] = nil
        cube["flotante"]!["bool"]!["-"] = nil
        cube["flotante"]!["bool"]!["*"] = nil
        cube["flotante"]!["bool"]!["/"] = nil
        cube["flotante"]!["bool"]![">"] = nil
        cube["flotante"]!["bool"]!["<"] = nil
        cube["flotante"]!["bool"]!["=="] = nil
        cube["flotante"]!["bool"]!["!="] = nil
        cube["flotante"]!["bool"]!["&"] = nil
        cube["flotante"]!["bool"]!["|"] = nil
        cube["flotante"]!["bool"]!["="] = nil
        
        cube["bool"]!["flotante"]!["+"] = nil
        cube["bool"]!["flotante"]!["-"] = nil
        cube["bool"]!["flotante"]!["*"] = nil
        cube["bool"]!["flotante"]!["/"] = nil
        cube["bool"]!["flotante"]![">"] = nil
        cube["bool"]!["flotante"]!["<"] = nil
        cube["bool"]!["flotante"]!["=="] = nil
        cube["bool"]!["flotante"]!["!="] = nil
        cube["bool"]!["flotante"]!["&"] = nil
        cube["bool"]!["flotante"]!["|"] = nil
        cube["bool"]!["flotante"]!["="] = nil
        
        //Char Char
        cube["char"]!["char"]!["+"] = nil
        cube["char"]!["char"]!["-"] = nil
        cube["char"]!["char"]!["*"] = nil
        cube["char"]!["char"]!["/"] = nil
        cube["char"]!["char"]![">"] = nil
        cube["char"]!["char"]!["<"] = nil
        cube["char"]!["char"]!["=="] = "bool"
        cube["char"]!["char"]!["!="] = "bool"
        cube["char"]!["char"]!["&"] = nil
        cube["char"]!["char"]!["|"] = nil
        cube["char"]!["char"]!["="] = "char"
        
        //Char Bool
        cube["char"]!["bool"]!["+"] = nil
        cube["char"]!["bool"]!["-"] = nil
        cube["char"]!["bool"]!["*"] = nil
        cube["char"]!["bool"]!["/"] = nil
        cube["char"]!["bool"]![">"] = nil
        cube["char"]!["bool"]!["<"] = nil
        cube["char"]!["bool"]!["=="] = nil
        cube["char"]!["bool"]!["!="] = nil
        cube["char"]!["bool"]!["&"] = nil
        cube["char"]!["bool"]!["|"] = nil
        cube["char"]!["bool"]!["="] = nil
        
        cube["bool"]!["char"]!["+"] = nil
        cube["bool"]!["char"]!["-"] = nil
        cube["bool"]!["char"]!["*"] = nil
        cube["bool"]!["char"]!["/"] = nil
        cube["bool"]!["char"]![">"] = nil
        cube["bool"]!["char"]!["<"] = nil
        cube["bool"]!["char"]!["=="] = nil
        cube["bool"]!["char"]!["!="] = nil
        cube["bool"]!["char"]!["&"] = nil
        cube["bool"]!["char"]!["|"] = nil
        cube["bool"]!["char"]!["="] = nil
        
        //Bool Bool
        cube["bool"]!["bool"]!["+"] = nil
        cube["bool"]!["bool"]!["-"] = nil
        cube["bool"]!["bool"]!["*"] = nil
        cube["bool"]!["bool"]!["/"] = nil
        cube["bool"]!["bool"]![">"] = nil
        cube["bool"]!["bool"]!["<"] = nil
        cube["bool"]!["bool"]!["=="] = nil
        cube["bool"]!["bool"]!["!="] = nil
        cube["bool"]!["bool"]!["&"] = "bool"
        cube["bool"]!["bool"]!["|"] = "bool"
        cube["bool"]!["bool"]!["="] = "bool"
        
    }
    
    /// checkCube
    /// - Parameters:
    ///   - leftType: Type of the left operand
    ///   - rightType: Type of the right operand
    ///   - myOperator: Operator used in the operation
    /// - Returns: The type resulting of the operation
    /// - Description: This function checks when operations are valid and returns the resulting type
    func chekCube(leftType:String, rightType: String, myOperator: String) -> String? {
        return cube[leftType]![rightType]![myOperator]
    }
}
