//
//  RequestMaker.swift
//  Pokedex
//
//  Created by Elias Medeiros on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

typealias RequestResult<Success> = Result<Success, RequestMaker.Error>

class RequestMaker {
    static let decoder = JSONDecoder()
    
    enum Endpoint {
        
        case list
        case details(query: String)
        
        var url: String {
            switch self {
            case .list:
                return "list"
            case let .details(query):
                return "details/\(query)"
            }
        }
        
        var modelType: Decodable.Type {
            switch self {
            case .list:
                return PokemonList.self
            case .details:
                return Pokemon.self
            }
        }
    }

    enum Error: Swift.Error {
        case some(Swift.Error)
        case missingData
    }
    
    let baseUrl = "http://localhost:3000/"
    let session: URLSessionType

    init(session: URLSessionType = URLSession.shared) {
        self.session = session
    }


    typealias CompletionCallback<T: Decodable> = (RequestResult<T>) -> Void
    typealias SuccessCallback<T: Decodable> = (T) -> Void

    func make<T: Decodable>(withEndpoint endpoint: Endpoint,
                            completion: @escaping SuccessCallback<T>) {
        make(withEndpoint: endpoint) { (result: RequestResult<T>) in
            switch result {
            case .success(let decodable):
                completion(decodable)
            case .failure:
                break
            }
        }
    }
    
    func make<T: Decodable>(withEndpoint endpoint: Endpoint,
                            completion: @escaping CompletionCallback<T>) {
        
        guard let url = URL(string: "\(baseUrl)\(endpoint.url)") else {
            return
        }
        
        session.request(with: url) {
            (data: Data?, response: URLResponse?, error: Swift.Error?) in
            
            guard error == nil else {
                completion(.failure(.some(error!)))
                return
            }
            
            guard let data = data else {
                completion(.failure(Error.missingData))
                return
            }
            
            do {
                let decodedObject = try type(of: self).decoder.decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch let error {
                completion(.failure(.some(error)))
            }
        }
    }
    
}
