//
//  RouteDetailsPageViewController.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

class RouteDetailsPageViewController: UIPageViewController {
    var routes: [Route] = []
    var routeIndex: Int = 0
    var routeDetailViewControllers: [RouteDetailsViewController] = []
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    convenience init(routes: [Route], routeIndex: Int = 0) {
        self.init()
        self.routes = routes
        self.routeIndex = routeIndex
        
        // Ideally, we would probably load the routes +/- n away from current index,
        // and then load the rest (paginate) as we get closer to the bounds
        // This is an optimization to consider
        self.routeDetailViewControllers = self.routes.map { (route) -> RouteDetailsViewController in
            return RouteDetailsViewController(route: route)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Route"
        dataSource = self
        
        let currentViewController = routeDetailViewControllers[routeIndex]
        setViewControllers([currentViewController],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
}

extension RouteDetailsPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? RouteDetailsViewController else { return nil }
        guard let viewControllerIndex = routeDetailViewControllers.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        let numViewControllers = routeDetailViewControllers.count
        
        guard nextIndex < numViewControllers else { return nil }
        return routeDetailViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? RouteDetailsViewController else { return nil }
        guard let viewControllerIndex = routeDetailViewControllers.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        guard previousIndex < routeDetailViewControllers.count else { return nil }
        
        return routeDetailViewControllers[previousIndex]
    }
}
