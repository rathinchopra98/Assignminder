//
//  Course.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-07.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation

class Course {
    var courseName: String
    var courseCode: String
    var courseDescription: String
    
    init(courseName: String, courseCode: String, courseDescription: String) {
        self.courseName = courseName
        self.courseCode = courseCode
        self.courseDescription = courseDescription
    }
}
