//
//  ImageExtensions.swift
//  
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func setStyle(_ imageStyle: ImageStyle) {
        if let image = imageStyle.image {
            self.image = image
        }
    }
}
