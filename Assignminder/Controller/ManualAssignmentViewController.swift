//
//  ManualAssignmentViewController.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-20.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit

class ManualAssignmentViewController: UIViewController {

    @IBOutlet weak var assignmentNameTxt: UITextField!
    @IBOutlet weak var dueDate: UIDatePicker!
    @IBOutlet weak var addAssignmentBtn: UIButton!
    
    var assignments = [Assignment]()
    var courseId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAssignmentBtn.layer.cornerRadius = addAssignmentBtn.frame.size.height/2
        addAssignmentBtn.setShadow(opacity: 0.65, radius: 5.0)
    }
    
    @IBAction func addAssignment(_ sender: Any) {
        let assignment = Assignment(assignmentName: assignmentNameTxt.text ?? "Null", dueDate: dueDate.date, courseId: courseId, userId: "rc@gmail.com", grade: 0, priorityKey: 0, weightage: 0 )
        assignments.append(assignment)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
