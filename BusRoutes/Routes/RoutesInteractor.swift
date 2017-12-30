//
//  RoutesInteractor.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation

class RoutesInteractor {
    func getRoutes(completion: @escaping (Any?, Error?) -> Void) {
        NetworkManager.sharedInstance.performRequest(urlString: "http://www.mocky.io/v2/5a0b474a3200004e08e963e5") { (jsonData, error) in
            completion(jsonData, error)
        }
    }
}
