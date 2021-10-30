//
//  ArrayExtensions.swift
//  
//
//  Created by João Luís on 29/10/2021.
//

import Foundation

extension Array {

    /**
     * Get Element in a safe way
     */
    func getOrNil(_ index: Int) -> Element? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}
