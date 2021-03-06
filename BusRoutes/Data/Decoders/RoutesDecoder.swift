//
//  RoutesDecoder.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation

class RoutesDecoder: Decoder {
    override func decoded(json: Any?) -> Any? {
        let routes = decode(json: json)
        return routes
    }
    
    func decode(json: Any?) -> [Route]? {
        guard let json = json as? [[String: Any]] else { return nil }
        let routes = json.flatMap { jsonData -> Route? in
            guard let id = jsonData["id"] as? String else { return nil }
            guard let name = jsonData["name"] as? String else { return nil }
            guard let description = jsonData["description"] as? String else { return nil }
            guard let accessible = jsonData["accessible"] as? Bool else { return nil }
            let imageUrl = jsonData["imageUrl"] as? String ?? nil
            guard let stops = jsonData["stops"] as? [[String: String]] else { return nil }
            
            let busStops = stops.flatMap({ (stop) -> BusStop? in
                guard let stopName = stop["name"] else { return nil }
                return BusStop(name: stopName)
            })
            
            let route = Route(id: id,
                         name: name,
                         description: description,
                         imageUrl: imageUrl,
                         accessible: accessible,
                         stops: busStops)
            return route
        }
        return routes
    }
}
