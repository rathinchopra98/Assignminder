//
//  CalculateCourseProgress.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-12-12.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation

class CalculateCourseProgress{
    
    func calculateCourseProgress(assignments : [Assignment]) -> Float{
        
        var total : Float = 0.0
        var fullMarks : Float = 0.0
        
        for item in assignments{
            total = total + item.grade
            fullMarks = fullMarks + item.weightage
        }
        
        return total
    }
    
}
