//
//  DefaultListablePresenter.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class DefaultListablePresenter {
    
    weak var cell: DefaultListableCellType? {
        willSet {
            if let cell: UITableViewCell = self.cell as? UITableViewCell, let tapGestureRecognizer: UITapGestureRecognizer = self.tapGestureRecognizer {
                cell.removeGestureRecognizer(tapGestureRecognizer)
            }
        }
        didSet {
            let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DefaultListablePresenter.tapRecognized(gesture:)))
            self.tapGestureRecognizer = tapGestureRecognizer
            if let cell: UITableViewCell = self.cell as? UITableViewCell {
                cell.addGestureRecognizer(tapGestureRecognizer)
            }
        }
    }
    
    var tapGestureRecognizer: UITapGestureRecognizer?
    
    let interactor: ListableInteractorType
    
    init(interactor: ListableInteractorType) {
        self.interactor = interactor
    }
    
    @objc func tapRecognized(gesture: UITapGestureRecognizer) {
        self.interactor.save()
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
