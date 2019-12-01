//
//  RandomColors.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-22.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation
import UIKit

class RandomColors{
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}
