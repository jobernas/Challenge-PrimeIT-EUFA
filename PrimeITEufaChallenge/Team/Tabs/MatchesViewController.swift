//
//  MatchesViewController.swift
//  PrimeITEufaChallenge
//
//  Created by João Luís on 28/10/2021.
//

import Foundation
import UIKit

class MatchesViewController: UIViewController {
    
    init(theme: AppThemeProtocol) {
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Static Methods
    static func newInstance(theme: AppThemeProtocol) -> MatchesViewController {
        return MatchesViewController(theme: theme)
    }
    
    //MARK: - Vars
    private var theme: AppThemeProtocol
    
    //MARK: - Super Methods
    override func viewDidLoad() {
        //TODO: Code for Matches here
    }
}
