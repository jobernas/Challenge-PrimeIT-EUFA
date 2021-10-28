//
//  IntExtensions.swift
//  
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

extension Int {
    func toFloat() -> Float {
        return Float(self)
    }
    
    func toLayoutPriority() -> UILayoutPriority {
        return UILayoutPriority(rawValue: self.toFloat())
    }
}
