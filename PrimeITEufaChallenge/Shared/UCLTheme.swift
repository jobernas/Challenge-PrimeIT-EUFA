//
//  UCLTheme.swift
//  PrimeITEufaChallenge
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

struct UCLTheme: AppThemeProtocol, TabsThemeProtocol {
    // MARK: - AppThemeProtocol
    var appBackgroundColor: UIColor = UIColor(red: 0, green: 0, blue: 0.25, alpha: 1)
    var appForegroundColor: UIColor = UIColor(red: 0.04, green: 0.04, blue: 0.38, alpha: 1)
    var appPrimaryTextColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    var appSecondaryTextColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
    var appBackgroundHeaderImage: UIImage? = UIImage(named: "BgUCLHeader")
    
    //MARK: - TabsThemeProtocol
    var tabsNormalColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    var tabsSelectedColor: UIColor = UIColor(red: 0.35, green: 0.97, blue: 0.86, alpha: 1)
    var tabsBackgroundColor: UIColor = UIColor(red: 0.08, green: 0.08, blue: 0.45, alpha: 1)
}
