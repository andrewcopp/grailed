//
//  DefaultListableCellType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

protocol DefaultListableCellType: ListableCellType {
    
    func primaryLabel() -> UILabel
    func secondaryLabel() -> UILabel
    func thumbnailImageView() -> UIImageView
    
}
