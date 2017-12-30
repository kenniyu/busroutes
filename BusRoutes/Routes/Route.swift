//
//  Route.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation
import UIKit

class Route {
    let id: String
    let name: String
    let description: String
    let accessible: Bool
    let imageUrl: String?
    let stops: [BusStop]
    var image: UIImage?
    
    public init(id: String, name: String, description: String, imageUrl: String?, accessible: Bool, stops: [BusStop]) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.accessible = accessible
        self.stops = stops
    }
}
