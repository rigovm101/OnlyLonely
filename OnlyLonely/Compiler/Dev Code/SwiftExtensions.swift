//
//  SwiftExtensions.swift
//  OnlyLonely
//
//  Created by Rigoberto Valadez on 24/04/21.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
