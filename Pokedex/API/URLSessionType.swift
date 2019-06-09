//
//  URLSessionType.swift
//  Pokedex
//
//  Created by Marcelo Gobetti on 6/9/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

protocol URLSessionType {
    func request(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: URLSessionType {
    func request(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
}
