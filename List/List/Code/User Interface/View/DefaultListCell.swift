//
//  DefaultListableCell.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import UIKit

class DefaultListableCell: UITableViewCell {

    var presenter: ListablePresenterType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension DefaultListableCell: ListableCellType {
    
    func set(presenter: ListablePresenterType) {
        self.presenter = presenter
    }
    
    func hydrate() {
        self.presenter?.load()
    }
    
}

extension DefaultListableCell: DefaultListableCellType {
    
    func primaryLabel() -> UILabel {
        return self.textLabel!
    }
    
    func secondaryLabel() -> UILabel {
        return UILabel()
    }
    
    func thumbnailImageView() -> UIImageView {
        return UIImageView()
    }
    
}
