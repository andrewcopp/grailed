//
//  DefaultListablePresenter.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class DefaultListablePresenter {
    
    weak var cell: DefaultListableCellType?
    let interactor: ListableInteractorType
    
    init(interactor: ListableInteractorType) {
        self.interactor = interactor
    }
    
}

extension DefaultListablePresenter: ListablePresenterType {
    
    func load() {
        self.cell?.primaryLabel().text = self.interactor.listable().primaryText()
        self.cell?.secondaryLabel().text = self.interactor.listable().secondaryText()
        self.cell?.thumbnailImageView().image = nil
    }
    
}

extension DefaultListablePresenter: DefaultListablePresenterType {
    
}
