//
//  BusRouteNavigationController.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import UIKit

class BusRouteNavigationController: UINavigationController, UINavigationControllerDelegate {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
}
