//
//  NetworkType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/13/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

protocol NetworkType {
    
    func read(requests: ReadRequestsType, completion: @escaping (ReadResponsesType) -> ())
    func write(requests: RequestsType, completion: @escaping (ResponsesType) -> ())
    
}
