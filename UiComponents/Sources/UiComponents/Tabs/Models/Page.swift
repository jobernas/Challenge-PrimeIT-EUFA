//
//  Page.swift
//  
//
//  Created by João Luís on 29/10/2021.
//

import Foundation
import UIKit

public class Page {
    public var name: String
    public var viewController: UIViewController
    
    public init(name: String, viewController: UIViewController) {
        self.name = name
        self.viewController = viewController
    }
}
