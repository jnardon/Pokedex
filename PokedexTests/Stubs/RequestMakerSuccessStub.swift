//
//  RequestMakerSuccessStub.swift
//  PokedexTests
//
//  Created by Marcelo Gobetti on 6/14/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

@testable import Pokedex

enum RequestMakerStubFactory {
    static func success() -> RequestMaker {
        let session = URLSessionMock(data: listStub)
        return RequestMaker(session: session)
    }
}
