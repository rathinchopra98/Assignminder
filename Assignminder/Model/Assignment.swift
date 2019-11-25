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
    
    init(assignmentName: String, dueDate: Date, courseId: String) {
        self.assignmentName = assignmentName
        self.dueDate = dueDate
        self.courseId = courseId
    }
}
