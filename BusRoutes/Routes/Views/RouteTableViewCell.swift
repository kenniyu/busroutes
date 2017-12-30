//
//  RouteTableViewCell.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

class RouteTableViewCellData {
    let name: String
    var imageUrl: String?
    
    init(name: String, imageUrl: String?) {
        self.name = name
        self.imageUrl = imageUrl
    }
}

protocol RouteTableViewCellDelegate {
    func fetchImage(route: Route)
}

class RouteTableViewCell: UITableViewCell {
    static let className = "RouteTableViewCell"
    static let reuseIdentifier = "RouteTableViewCell"
    static let nib = UINib(nibName: className, bundle: Bundle(for: RouteTableViewCell.self))
    
    @IBOutlet weak var routeName: UILabel!
    @IBOutlet weak var busImageView: UIImageView!
    var delegate: RouteTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupStyles()
    }
    
    func setupStyles() {
        // Do any kind of styling here
    }

    func setup(route: Route) {
        if let image = route.image {
            self.busImageView.image = image
            self.busImageView.contentMode = .scaleAspectFill
        } else {
            self.busImageView.image = UIImage(named: "bus-icon")
            self.busImageView.contentMode = .center
        }
        self.routeName.text = route.name
    }
}
