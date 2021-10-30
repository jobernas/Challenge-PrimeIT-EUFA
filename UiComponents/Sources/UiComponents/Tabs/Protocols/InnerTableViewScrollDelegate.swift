//
//  InnerTableViewScrollDelegate.swift
//  
//
//  Created by João Luís on 29/10/2021.
//

import Foundation
import UIKit

public protocol InnerTableViewScrollDelegate {
    
    var currentHeaderHeight: CGFloat { get }
    
    func innerTableViewDidScroll(withDistance scrollDistance: CGFloat)
    func innerTableViewScrollEnded(withScrollDirection scrollDirection: DragDirection)
}
