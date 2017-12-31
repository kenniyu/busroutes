//
//  RoutesDecoderTests.swift
//  BusRoutesTests
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import XCTest

class RoutesDecoderTests: XCTestCase {
    func testDecodeRoutes() {
        // This is an example of a decoder unit test
        guard let path = Bundle.main.path(forResource: "Routes", ofType: "json") else {
            XCTFail("Unable to find mock JSON file for Routes")
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]

            guard let routes = RoutesDecoder().decoded(json: jsonSerialized) as? [Route] else {
                XCTFail("Unable to decode data as Routes")
                return
            }
            
            XCTAssertEqual(routes.count, 2)
            XCTAssertEqual(routes[0].name, "Fayette Street")
            XCTAssertEqual(routes[0].accessible, true)
            XCTAssertEqual(routes[0].stops.count, 2)
            XCTAssertEqual(routes[0].stops[0].name, "Cleveland Street")
        } catch let error {
            XCTFail("Unexpected error occurred while converting mock data: \(error)")
        }
    }
}
