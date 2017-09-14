//
//  Network.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class HTTP {
    
    let host: String
    let urlSession: URLSession
    
    init(host: String) {
        self.host = host
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: configuration)
    }
    
}

extension HTTP: NetworkType {
    
    func read(requests: ReadRequestsType, completion: @escaping (ReadResponsesType) -> ()) {
        
        if requests.requests().count != 1 {
            // TODO - Batching
            return
        }
    
        requests.requests().forEach() { request in
            
            let url: URL = URL(string: self.host)!.appendingPathComponent("articles").appendingPathComponent("ios_index")
            var urlRequest: URLRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            
            print(url)
            
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
                
                let responses: [ReadResponseType] = [ReadResponse(objects: json.flatMap({ Article(json: $0) }))]
                let response: ReadResponsesType = ReadResponses(responses: responses)
                completion(response)
                
            }.resume()
            
        }
        
    }
    
    func write(requests: RequestsType, completion: @escaping (ResponsesType) -> ()) {

    }
    
}

