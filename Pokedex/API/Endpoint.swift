//
//  Endpoint.swift
//  Pokedex
//
//  Created by Elias Medeiros on 19/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension RequestMaker {
    
    enum Endpoint {
        
        case list
        case details(query: String)
        case favorites(ids: Set<String>)
        
        var url: String {
            switch self {
            case .list:
                return "list"
            case let .details(query):
                return "details/\(query)"
            case let .favorites(ids):
                return "details\(destrinchIdsAsParams(ids))"
            }
        }
        
    }
    
}

private func destrinchIdsAsParams(_ ids: Set<String>) -> String {
    var localCopiedIds = ids
    var result = "?id=\(localCopiedIds.removeFirst())"
    
    for id in localCopiedIds {
        result += "&id=\(id)"
    }
    
    return result
}
