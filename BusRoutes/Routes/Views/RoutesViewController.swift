//
//  RoutesViewController.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

struct BusStop {
    let name: String
}

class RoutesViewController: BaseViewController {
    var presenter: RoutesPresenter?
    var viewModel: RoutesViewModel?
    var eventHandler: RoutesEventHandler!
    
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    convenience init() {
        self.init(nibName: RoutesViewController.nibName, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        eventHandler.didLoad()
    }
    
    func setup() {
        title = "Routes"
        setupTableView()
        
        let presenter = RoutesPresenter(viewController: self)
        viewModel = presenter
        eventHandler = presenter
    }
    
    func setupTableView() {
        registerCells()
        tableView.tableFooterView = UIView()
    }
    
    func registerCells() {
        tableView.register(RouteTableViewCell.nib, forCellReuseIdentifier: RouteTableViewCell.reuseIdentifier)
    }
    
    func updateRoutes() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: UITableView methods
extension RoutesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.routes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RouteTableViewCell.reuseIdentifier, for: indexPath) as? RouteTableViewCell,
            let viewModel = self.viewModel else {
            return UITableViewCell()
        }
        
        let route = viewModel.routes[indexPath.row]
        cell.setup(route: route)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RouteTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = self.viewModel else { return }
        
        // Push the page VC containing all routes
        let routesPageViewController = RouteDetailsPageViewController(routes: viewModel.routes, routeIndex: indexPath.row)
        navigationController?.pushViewController(routesPageViewController, animated: true)
        
        // It appears that we don't want a back title, which makes sense if
        // swiping right shows previous route instead of going back to list view.
        // However, this is definitely a behavior to call out, as it can collide
        // with expected behavior of popping current controller from navigation stack
        navigationItem.backBarButtonItem?.title = ""
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
