//
//  Network.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType

public class HTTP {
    
    let host: String
    let urlSession: URLSession
    
    public init(host: String) {
        self.host = host
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: configuration)
    }
    
}

extension HTTP: AsynchronousStoreType {
    
    public func read(requests: ReadRequestsType, completion: @escaping (ReadResponsesType) -> ()) {
        
        if requests.requests().count != 1 {
            // TODO - Batching
            return
        }
    
        requests.requests().forEach() { request in
            
            var url: URL = URL(string: self.host)!
            
            switch requests.model() {
            case "articles":
                url = url.appendingPathComponent("articles").appendingPathComponent("ios_index")
            case "searches":
                url = url.appendingPathComponent("merchandise").appendingPathComponent("marquee")
            default:
                url = url.appendingPathComponent(requests.model())
            }
            
            var urlRequest: URLRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
                        
            self.urlSession.dataTask(with: urlRequest) { optionalData, optionalResponse, optionalError in
                                
                if let error: Error = optionalError {
                    print(error)
                }
                
                guard let data: Data = optionalData else {
                    return
                }
                
                let optionalJSON: JSONDictionary?
                do {
                    optionalJSON = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
                } catch {
                    print(error)
                    return
                }
                
                guard let json: JSONArray = optionalJSON?["data"] as? JSONArray else {
                    return
                }
                
                let responses: [ReadResponseType] = [ReadResponse(objects: json)]
                let response: ReadResponsesType = ReadResponses(responses: responses)
                completion(response)
                
            }.resume()
            
        }
        
    }
    
    public func write(requests: WriteRequestsType, completion: @escaping (WriteResponsesType) -> ()) {

    }
    
}

