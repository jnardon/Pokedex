//
//  URLSessionMock.swift
//  PokedexTests
//
//  Created by Marcelo Gobetti on 6/9/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

@testable import Pokedex
import Foundation

class URLSessionMock: URLSessionType {
    private let data: Data

    init(data: Data) {
        self.data = data
    }

    func request(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completionHandler(data, nil, nil)
    }
}
