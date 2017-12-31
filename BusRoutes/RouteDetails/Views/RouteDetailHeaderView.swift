//
//  RouteDetailHeaderView.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

class RouteDetailHeaderView: UIView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var accessibilityIcon: UIImageView!
    @IBOutlet weak var routeImageView: UIImageView!
    
    static let className = "RouteDetailHeaderView"
    static let height: CGFloat = 120
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let views = Bundle.main.loadNibNamed(type(of: self).className, owner: self, options: nil)
        self.view = views?.first as! UIView
        view.backgroundColor = UIColor.clear
        
        // Add subview
        addSubview(self.view)
        
        // Adjust bounds
        self.view.frame = self.bounds
        
        layoutIfNeeded()
        
        view.clipsToBounds = true
    }
    
    func setupStyles() {
        containerView.backgroundColor = .white
    }
    
    func setup(route: Route) {
        setupStyles()
        loadDataIntoViews(route: route)
    }
    
    func loadDataIntoViews(route: Route) {
        titleLabel.text = route.name
        descriptionLabel.text = route.description
        accessibilityIcon.isHidden = !route.accessible
        
        if let image = route.image {
            routeImageView.image = image
        } else {
            routeImageView.image = UIImage(named: "bus-icon" )
        }
    }
}
