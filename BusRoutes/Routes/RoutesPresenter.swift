//
//  RoutesPresenter.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation
import UIKit

class RoutesPresenter: RoutesViewModel {
    var interactor = RoutesInteractor()
    var viewController: RoutesViewController
    var routes: [Route] = []
    
    init(viewController: RoutesViewController) {
        self.viewController = viewController
    }
    
    // Presenter tells interactor to make network requests
    func fetchAndDisplayBusRoutes() {
        interactor.getRoutes { [weak self] (jsonData, error) in
            guard let `self` = self else { return }
            
            // Afterwards, updates view model
            guard let routes = RoutesDecoder().decoded(json: jsonData) as? [Route] else {
                self.viewController.displayAlert(message: "Unable to decode routes")
                return
            }
            
            self.routes = routes
            self.routes.forEach({ [weak self] (route) in
                guard let `self` = self else { return }
                
                // Ideally we would use SDWebImage for this, a library dedicated to fetching and caching
                self.fetchRouteImage(route: route, completion: { (imageData) in
                    route.image = UIImage(data: imageData)
                    self.viewController.updateRoutes()
                })
            })
            
            // Then notifies view controller to update
            self.viewController.updateRoutes()
        }
    }
    
    func fetchRouteImage(route: Route, completion: @escaping (Data) -> Void) {
        guard let imageUrl = route.imageUrl,
            let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let imageData = data, error == nil else { return }
            completion(imageData)
        }.resume()
    }
}
