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
        NetworkManager.sharedInstance.performRequest(urlString: Urls.allRoutes.urlString()) { (jsonData, error) in
            completion(jsonData, error)
        }
    }
}
