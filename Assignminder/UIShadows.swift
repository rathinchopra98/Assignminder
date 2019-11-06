//
//  UIShadows.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-06.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setShadow(opacity: Float, radius: CGFloat ) {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
}
