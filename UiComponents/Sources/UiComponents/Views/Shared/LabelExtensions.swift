//
//  UILabelExtensions.swift
//  
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

extension UILabel {
    func setStyle(_ labelStyle: LabelStyle) {
        if let textColor = labelStyle.textColor {
            self.textColor = textColor
        }
        if let textFont = labelStyle.textFont {
            self.font = textFont
        }
    }
}
