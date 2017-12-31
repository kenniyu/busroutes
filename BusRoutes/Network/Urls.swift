//
//  Urls.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation

enum Urls {
    case allRoutes
    
    func urlString() -> String {
        switch self {
        case .allRoutes:
            return "http://www.mocky.io/v2/5a0b474a3200004e08e963e5"
        }
    }
}
