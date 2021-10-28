//
//  UELTheme.swift
//  PrimeITEufaChallenge
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

struct UELTheme: AppThemeProtocol, TabsThemeProtocol {
    
    // MARK: - AppThemeProtocol
    var appBackgroundColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    var appForegroundColor: UIColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1)
    var appPrimaryTextColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    var appSecondaryTextColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
    var appBackgroundHeaderImage: UIImage? = UIImage(named: "BgUELHeader")
    
    //MARK: - TabsThemeProtocol
    var tabsNormalColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    var tabsSelectedColor: UIColor = UIColor(red: 1, green: 0.41, blue: 0.0, alpha: 1)
    var tabsBackgroundColor: UIColor = UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1)
}
