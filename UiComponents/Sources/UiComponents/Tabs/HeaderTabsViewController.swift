//
//  HeaderTabsViewController.swift
//  
//
//  Created by João Luís on 29/10/2021.
//

import Foundation
import UIKit

open class HeaderTabsViewController: UIViewController {
    
    //MARK: - Vars
    open var topViewInitialHeight: CGFloat = 200
    public let topViewFinalHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height + 44 //navigation hieght
    public var headerViewHeightConstraint: NSLayoutConstraint? = nil
    public var pageViewController: UIPageViewController = UIPageViewController()
    public var pageCollection: PageCollection = PageCollection(pages: [])
    
    //MARK: - Views
    open var headerView: UIView = UIView()
    public var tabBarCollectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    public var selectedTabView: SelectedTabView = SelectedTabView()
    public var pageView: UIView = UIView()
    
    //MARK: - Super
    open override func viewDidLoad() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tabBarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        pageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        view.addSubview(tabBarCollectionView)
        view.addSubview(pageView)
        view.autoresizesSubviews = true

        // Add Constraints
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerViewHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: topViewInitialHeight)
        headerViewHeightConstraint?.isActive = true
        tabBarCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tabBarCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tabBarCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageView.topAnchor.constraint(equalTo: tabBarCollectionView.bottomAnchor).isActive = true
        pageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.updateConstraintsIfNeeded()

        //
        setupCollectionView()
        setupPagingViewController()
        populatePageView()
    }
    
    //MARK: - Private Methods
    func setupCollectionView() {
        let layout = tabBarCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.estimatedItemSize = CGSize(width: 100, height: 50)
//        tabBarCollectionView.register(UINib(nibName: TabBarCollectionViewCellID, bundle: nil),
//                                      forCellWithReuseIdentifier: TabBarCollectionViewCellID)
//        tabBarCollectionView.dataSource = self
        tabBarCollectionView.delegate = self
        setupSelectedTabView()
    }
    
    func setupSelectedTabView() {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 10))
        label.text = "TAB \(1)"
        label.sizeToFit()
        var width = label.intrinsicContentSize.width
        width = width + 40
        
        selectedTabView.frame = CGRect(x: 20, y: 55, width: width, height: 5)
        selectedTabView.backgroundColor = UIColor(red:0.65, green:0.58, blue:0.94, alpha:1)
        tabBarCollectionView.addSubview(selectedTabView)
    }
    
    func setupPagingViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                          navigationOrientation: .horizontal,
                                                          options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
    
    func populatePageView() {
            
//        for subTabCount in 0..<pageCollection.pages.count {
//
////            let tabContentVC = ContentViewController1()
////            tabContentVC.innerTableViewScrollDelegate = self
////            tabContentVC.numberOfCells = 30 // (subTabCount + 1) * 10
//
////            let displayName = "TAB \(subTabCount + 1)"
////            let page = Page(with: displayName, _vc: tabContentVC)
////            pageCollection.pages.append(page)
//        }
        
        guard let selectedPage = pageCollection.getSelectedPage() else {
            return
        }
        pageViewController.setViewControllers([selectedPage.viewController],
                                                  direction: .forward,
                                                  animated: true,
                                                  completion: nil)
        addChild(pageViewController)
        pageViewController.willMove(toParent: self)
        pageView.addSubview(pageViewController.view)
//        pinPagingViewControllerToBottomView()
    }
    
    func pinPagingViewControllerToBottomView() {
        pageView.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false

        pageViewController.view.leadingAnchor.constraint(equalTo: pageView.leadingAnchor).isActive = true
        pageViewController.view.trailingAnchor.constraint(equalTo: pageView.trailingAnchor).isActive = true
        pageViewController.view.topAnchor.constraint(equalTo: pageView.topAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: pageView.bottomAnchor).isActive = true
    }
    
    func addPanGestureToTopViewAndCollectionView() {
        
        let topViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(topViewMoved))
        
        headerView.isUserInteractionEnabled = true
        headerView.addGestureRecognizer(topViewPanGesture)
        
        /* Adding pan gesture to collection view is overriding the collection view scroll.
         
        let collViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(topViewMoved))
        
        tabBarCollectionView.isUserInteractionEnabled = true
        tabBarCollectionView.addGestureRecognizer(collViewPanGesture)
         
        */
    }
    
    func scrollSelectedTabView(toIndexPath indexPath: IndexPath, shouldAnimate: Bool = true) {
        UIView.animate(withDuration: 0.3) {
            if let cell = self.tabBarCollectionView.cellForItem(at: indexPath) {
                self.selectedTabView.frame.size.width = cell.frame.width
                self.selectedTabView.frame.origin.x = cell.frame.origin.x
            }
        }
    }
    
    func setBottomPagingView(toPageWithAtIndex index: Int, andNavigationDirection navigationDirection: UIPageViewController.NavigationDirection) {
        pageViewController.setViewControllers([pageCollection.pages[index].viewController],
                                                  direction: navigationDirection,
                                                  animated: true,
                                                  completion: nil)
    }
    
    // TODO: Move to Super After Testing
    private var dragInitialY: CGFloat = 0
    private var dragPreviousY: CGFloat = 0
    private var dragDirection: DragDirection = .up
    
    // MARK: - Actions
    @objc func topViewMoved(_ gesture: UIPanGestureRecognizer) {
            
        var dragYDiff : CGFloat
        switch gesture.state {
        case .began:
            dragInitialY = gesture.location(in: self.view).y
            dragPreviousY = dragInitialY
        case .changed:
            let dragCurrentY = gesture.location(in: self.view).y
            dragYDiff = dragPreviousY - dragCurrentY
            dragPreviousY = dragCurrentY
            dragDirection = dragYDiff < 0 ? .down : .up
            innerTableViewDidScroll(withDistance: dragYDiff)
        case .ended:
            innerTableViewScrollEnded(withScrollDirection: dragDirection)
        default: return
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HeaderTabsViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == pageCollection.selectedPage {
            return
        }
        
        var direction: UIPageViewController.NavigationDirection
        if indexPath.item > pageCollection.selectedPage {
            direction = .forward
        } else {
            direction = .reverse
        }
        
        pageCollection.selectedPage = indexPath.item
        tabBarCollectionView.scrollToItem(at: indexPath,
                                          at: .centeredHorizontally,
                                          animated: true)
        
        scrollSelectedTabView(toIndexPath: indexPath)
        setBottomPagingView(toPageWithAtIndex: indexPath.item, andNavigationDirection: direction)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

// MARK: - UIPageViewControllerDelegate
extension HeaderTabsViewController: UIPageViewControllerDataSource {
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentViewControllerIndex = pageCollection.pages.firstIndex(where: { $0.viewController == viewController }) {
            if (1..<pageCollection.pages.count).contains(currentViewControllerIndex) {
                // go to previous page in array
                return pageCollection.pages[currentViewControllerIndex - 1].viewController
            }
        }
        return nil
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentViewControllerIndex = pageCollection.pages.firstIndex(where: { $0.viewController == viewController }) {
            if (0..<(pageCollection.pages.count - 1)).contains(currentViewControllerIndex) {
                // go to next page in array
                return pageCollection.pages[currentViewControllerIndex + 1].viewController
            }
        }
        return nil
    }
}

// MARK: - UIPageViewControllerDelegate
extension HeaderTabsViewController: UIPageViewControllerDelegate {
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard completed else { return }
        guard let currentVC = pageViewController.viewControllers?.first else { return }
        guard let currentVCIndex = pageCollection.pages.firstIndex(where: { $0.viewController == currentVC }) else { return }
        
        let indexPathAtCollectionView = IndexPath(item: currentVCIndex, section: 0)
        scrollSelectedTabView(toIndexPath: indexPathAtCollectionView)
        tabBarCollectionView.scrollToItem(at: indexPathAtCollectionView,
                                          at: .centeredHorizontally,
                                          animated: true)
    }
}

// MARK: - InnerTableViewScrollDelegate
extension HeaderTabsViewController: InnerTableViewScrollDelegate {
    
    public var currentHeaderHeight: CGFloat {
        return headerViewHeightConstraint?.constant ?? 0
    }
    
    public func innerTableViewDidScroll(withDistance scrollDistance: CGFloat) {
        guard let headerViewHeightConstraint = headerViewHeightConstraint else {
            return
        }
        headerViewHeightConstraint.constant -= scrollDistance
        
        /* Don't restrict the downward scroll.
 
        if headerViewHeightConstraint.constant > topViewInitialHeight {
            headerViewHeightConstraint.constant = topViewInitialHeight
        }
         
        */
        
        if headerViewHeightConstraint.constant < topViewFinalHeight {
            headerViewHeightConstraint.constant = topViewFinalHeight
        }
    }
    
    public func innerTableViewScrollEnded(withScrollDirection scrollDirection: DragDirection) {
        
        let topViewHeight = headerViewHeightConstraint?.constant ?? 0
        
        /*
         *  Scroll is not restricted.
         *  So this check might cause the view to get stuck in the header height is greater than initial height.
 
        if topViewHeight >= topViewInitialHeight || topViewHeight <= topViewFinalHeight { return }
         
        */
        
        if topViewHeight <= topViewFinalHeight + 20 {
            scrollToFinalView()
        } else if topViewHeight <= topViewInitialHeight - 20 {
            switch scrollDirection {
            case .down: scrollToInitialView()
            case .up: scrollToFinalView()
            }
        } else {
            scrollToInitialView()
        }
    }
    
    public func scrollToInitialView() {
        
        let topViewCurrentHeight = headerView.frame.height
        let distanceToBeMoved = abs(topViewCurrentHeight - topViewInitialHeight)
        var time = distanceToBeMoved / 500
        if time < 0.25 {
            time = 0.25
        }
        
        headerViewHeightConstraint?.constant = topViewInitialHeight
        UIView.animate(withDuration: TimeInterval(time), animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    public func scrollToFinalView() {
        
        let topViewCurrentHeight = headerView.frame.height
        let distanceToBeMoved = abs(topViewCurrentHeight - topViewFinalHeight)
        var time = distanceToBeMoved / 500
        if time < 0.25 {
            time = 0.25
        }
        
        headerViewHeightConstraint?.constant = topViewFinalHeight
        UIView.animate(withDuration: TimeInterval(time), animations: {
            self.view.layoutIfNeeded()
        })
    }
}

