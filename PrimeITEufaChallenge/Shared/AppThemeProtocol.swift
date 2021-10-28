//
//  AppThemeProtocol.swift
//  PrimeITEufaChallenge
//
//  Created by João Luís on 27/10/2021.
//

import Foundation
import UIKit

protocol AppThemeProtocol {
    // MARK: - APP Colors
    var appBackgroundColor: UIColor { get }
    var appForegroundColor: UIColor { get }
    var appPrimaryTextColor: UIColor { get }
    var appSecondaryTextColor: UIColor { get }
    // MARK: - APP Images
    var appBackgroundHeaderImage: UIImage? { get }
}
