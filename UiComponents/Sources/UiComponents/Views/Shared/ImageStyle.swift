//
//  ImageStyle.swift
//  
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

public struct ImageStyle {
    public let image: UIImage?
    // TODO: Add other properties for image style here
    
    init() {
        self.image = nil
    }
    
    init(image: UIImage?){
        self.image = image
    }
    
    public class ImageStyleBuilder {
        private var image: UIImage? = nil
        
        public func setImage(_ image: UIImage?) -> ImageStyleBuilder {
            self.image = image
            return self
        }
        
        public func build() -> ImageStyle {
            return ImageStyle(image: self.image)
        }
    }
}
