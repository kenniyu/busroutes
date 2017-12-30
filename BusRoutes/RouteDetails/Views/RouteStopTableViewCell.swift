//
//  RouteStopTableViewCell.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

struct RouteStopTableViewCellData {
    let isFirstStop: Bool
    let isLastStop: Bool
    let stop: BusStop
}

class RouteStopTableViewCell: UITableViewCell {
    static let className = "RouteStopTableViewCell"
    static let reuseIdentifier = "RouteStopTableViewCell"
    static let nib = UINib(nibName: className, bundle: Bundle(for: RouteStopTableViewCell.self))
    
    @IBOutlet weak var prevStepConnector: UIImageView!
    @IBOutlet weak var nextStepConnector: UIImageView!
    @IBOutlet weak var routeStopBullet: UIImageView!
    @IBOutlet weak var stopName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupStyles()
    }

    func setupStyles() {
        // Do additional styling here
    }
    
    func setup(cellData: RouteStopTableViewCellData) {
        prevStepConnector.isHidden = cellData.isFirstStop
        nextStepConnector.isHidden = cellData.isLastStop
        stopName.text = cellData.stop.name
    }
}
