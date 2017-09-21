//
//  ListableInteractor.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType

class ListableInteractor {
    
    let _listable: Listable
    
    let store: StoreType
    
    init(listable: Listable, store: StoreType) {
        self._listable = listable
        self.store = store
    }
    
}

extension ListableInteractor: ListableInteractorType {
    
    func listable() -> Listable {
        return self._listable
    }
    
    func save() {
        guard let storable: Storable = self._listable as? Storable else {
            return
        }
        
        let json: JSONDictionary = ["id" : 1 as AnyObject, "values" : storable.toJSON() as AnyObject]
        let request: CreateRequest = CreateRequest(object: json)
        let requests: CreateRequests = CreateRequests(model: "favorites", properties: ["values"], requests: [request])
        _ = store.write(request: requests)
        
        let notification: Notification = Notification.init(name: Notification.Name(rawValue: "ApplicationDidRefreshStorables"))
        NotificationCenter.default.post(notification)
    }
    
}
