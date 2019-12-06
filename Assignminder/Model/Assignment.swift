//
//  Assignment.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-07.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation

class Assignment {
    
    var assignmentName: String
    var dueDate: Date
    var courseId: String
    var userId: String
    var grade: Float
    var priorityKey: Int
    var weightage: Float
    
    init(assignmentName: String, dueDate: Date, courseId: String, userId: String, grade: Float, priorityKey: Int, weightage: Float) {
        self.assignmentName = assignmentName
        self.dueDate = dueDate
        self.courseId = courseId
        self.userId = userId
        self.grade = grade
        self.priorityKey = priorityKey
        self.weightage = weightage
    }
}
