//
//  RoutesEventHandler.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation

protocol RoutesEventHandler: class {
    func didLoad()
}

extension RoutesPresenter: RoutesEventHandler {
    func didLoad() {
        fetchAndDisplayBusRoutes()
    }
}
