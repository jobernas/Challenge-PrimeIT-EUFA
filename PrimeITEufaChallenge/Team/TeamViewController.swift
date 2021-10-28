//
//  TeamViewController.swift
//  PrimeITEufaChallenge
//
//  Created by João Luís on 27/10/2021.
//

import Foundation
import UIKit
import UiComponents

class TeamViewController: UIViewController {
    
    init(theme: AppThemeProtocol) {
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Static Methods
    static func newInstance(theme: AppThemeProtocol) -> TeamViewController {
        return TeamViewController(theme: theme)
    }
    
    //MARK: - Vars
    private var theme: AppThemeProtocol
    private var pageViewController: UIPageViewController = UIPageViewController()
    
    //MARK: - Views
    private var headerView: TeamHeaderView = TeamHeaderView()
    // TODO: check if this needs to be components or not
    private var tabBarCollectionView: UICollectionView = UICollectionView()
    private var selectedTabView: UIView = UIView()
    
    //MARK: - Super Methods
    override func viewDidLoad() {
        // Update View
        self.view.backgroundColor = theme.appBackgroundColor
    }
}
