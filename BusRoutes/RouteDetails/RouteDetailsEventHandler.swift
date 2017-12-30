//
//  RouteDetailsEventHandler.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation

protocol RouteDetailsEventHandler: class {
    func didLoad()
}

extension RouteDetailsPresenter: RouteDetailsEventHandler {
    func didLoad() {
        self.viewController.updateStops()
    }
}
