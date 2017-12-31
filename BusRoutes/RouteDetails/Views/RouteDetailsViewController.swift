//
//  RouteDetailsViewController.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

class RouteDetailsViewController: BaseViewController {
    var presenter: RoutesPresenter?
    var route: Route!
    var eventHandler: RouteDetailsEventHandler!
    var headerView: RouteDetailHeaderView?
    
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(route: Route) {
        self.init(nibName: RouteDetailsViewController.nibName, bundle: nil)
        self.route = route
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        
        eventHandler.didLoad()
    }
    
    func setup() {
        setupTableView()
        
        let presenter = RouteDetailsPresenter(viewController: self)
        eventHandler = presenter
    }
    
    func registerCells() {
        tableView.register(RouteStopTableViewCell.nib, forCellReuseIdentifier: RouteStopTableViewCell.reuseIdentifier)
    }
    
    func setupTableView() {
        registerCells()
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        tableView.tableFooterView = UIView()
        
        let headerView = RouteDetailHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: RouteDetailHeaderView.height))
        headerView.setup(route: route)
        tableView.tableHeaderView = headerView
    }
    
    func updateStops() {
        tableView.reloadData()
    }
}

// MARK: UITableView methods
extension RouteDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return route.stops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RouteStopTableViewCell.reuseIdentifier, for: indexPath) as? RouteStopTableViewCell else {
            return UITableViewCell()
        }
        
        let stop = route.stops[indexPath.row]
        let routeStopCellData = RouteStopTableViewCellData(isFirstStop: indexPath.row == 0,
                                                           isLastStop: indexPath.row == route.stops.count - 1,
                                                           stop: stop)
        cell.setup(cellData: routeStopCellData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RouteStopTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
