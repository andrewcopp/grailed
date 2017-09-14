//
//  Network.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class HTTP {
    
    let urlSession: URLSession
    
    init() {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: configuration)
    }
    
}

extension HTTP: NetworkType {
    
    func execute(requests: RequestsType, completion: (ResponsesType) -> ()) {
        
        if requests.requests().count > 1 {
            // TODO - Batching
            return
        }
    
        requests.requests().forEach() { request in
            
            let url: URL = URL(string: "")!
            var urlRequest: URLRequest = URLRequest(url: url)
            
            switch type(of: requests).method {
            case Method.create:
                urlRequest.httpMethod = HTTPMethod.post.rawValue
            case Method.read:
                urlRequest.httpMethod = HTTPMethod.get.rawValue
            case Method.update:
                urlRequest.httpMethod = HTTPMethod.put.rawValue
            case Method.delete:
                urlRequest.httpMethod = HTTPMethod.delete.rawValue
            }
            
            self.urlSession.dataTask(with: urlRequest) { optionalData, optionalResponse, optionalError in
                //
            }.resume()
            
        }
        
    }
    
}

