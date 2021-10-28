//
//  LabelStyle.swift
//  
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

public struct LabelStyle {
    public let textFont: UIFont?
    public let textColor: UIColor?
    // TODO: Add other properties for label style here
    
    init() {
        self.textFont = nil
        self.textColor = nil
    }
    
    init(textFont: UIFont?, textColor: UIColor?){
        self.textFont = textFont
        self.textColor = textColor
    }
    
    public class LabelStyleBuilder {
        private var textFont: UIFont? = nil
        private var textColor: UIColor? = nil
        
        public func setTextFont(_ textFont: UIFont) -> LabelStyleBuilder {
            self.textFont = textFont
            return self
        }
        
        public func setTextColor(_ textColor: UIColor) -> LabelStyleBuilder {
            self.textColor = textColor
            return self
        }
        
        public func build() -> LabelStyle {
            return LabelStyle(textFont: self.textFont, textColor: self.textColor)
        }
    }
}
