//
//  NetworkManager.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/29/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation

enum RequestType {
    case get
    case post
    case put
    case delete
    
    func toString() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}

public class NetworkManager {
    public static let sharedInstance = NetworkManager()
    
    func performRequest(urlString: String,
                        type: RequestType = .get,
                        params: [String: Any]? = nil,
                        completion: @escaping (Any?, Error?) -> Void) {
        // Set the URL the request is being made to.
        guard let url = URL(string: urlString) else { return }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = type.toString()
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let data = data {
                do {
                    // Convert the data to JSON
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    completion(jsonSerialized, nil)
                }  catch let error {
                    completion(nil, error)
                }
            } else if let error = error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
