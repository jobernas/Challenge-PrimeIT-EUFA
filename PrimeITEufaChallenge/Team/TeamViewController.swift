//
//  TeamViewController.swift
//  PrimeITEufaChallenge
//
//  Created by João Luís on 27/10/2021.
//

import Foundation
import UIKit
import UiComponents

class TeamViewController: HeaderTabsViewController {
    
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
    override var topViewInitialHeight: CGFloat {
        get {
            return 286.0
        }
        set {}
    }
//    private var pageViewController: UIPageViewController = UIPageViewController()
//    private var pageCollection: PageCollection = PageCollection(pages: [])
    
    //MARK: - Views
    private let teamHeaderView = TeamHeaderView()
    override var headerView: UIView {
        get {
            return teamHeaderView
        }
        set { }
    }
//    private var headerView: TeamHeaderView = TeamHeaderView()
//    // TODO: check if this needs to be components or not
//    private var tabBarCollectionView: UICollectionView = UICollectionView()
//    private var selectedTabView: UIView = UIView()
//    private var pageView: UIView = UIView()
    
    //MARK: - Super Methods
    override func viewDidLoad() {
        // Load Controllers
        pageCollection = PageCollection(pages: [
            Page(name: "Overview", viewController: OverviewViewController.newInstance(theme: theme)),
            Page(name: "Matches", viewController: MatchesViewController.newInstance(theme: theme)),
            Page(name: "Groups", viewController: GroupsViewController.newInstance(theme: theme)),
            Page(name: "Stats", viewController: StatsViewController.newInstance(theme: theme)),
            Page(name: "Squad", viewController: SquadViewController.newInstance(theme: theme))
        ])
        //
        super.viewDidLoad()
        
        // Update Views
        view.backgroundColor = theme.appBackgroundColor
        teamHeaderView.setTitle("Testing")
        teamHeaderView.setBackgroundImage(theme.appBackgroundHeaderImage)
        teamHeaderView.setRound(20)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
}
