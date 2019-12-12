//
//  CoursePrioritization.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-12-11.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation
import UIKit

class CoursePrioritization{
    
    func priortizeAssignments(assignments : [Assignment], courses : [Course]) -> [Assignment]{
        
        for course in courses{
            var courseAssignments = assignments.filter {
                $0.courseId == course.courseCode
            }
            courseAssignments = courseAssignments.sorted(by: { $0.weightage > $1.weightage })
            var priorityKeyCounter = 1
            for item in courseAssignments{
                if(item.grade == 0.0){
                    item.priorityKey = priorityKeyCounter
                    assignments.first(where: { $0.assignmentName == item.assignmentName && $0.courseId == item.courseId })?.priorityKey = item.priorityKey
                    priorityKeyCounter = priorityKeyCounter + 1
                }
                else{
                    item.priorityKey = 0
                }
            }
        }
        
        return assignments
    }
    
}
