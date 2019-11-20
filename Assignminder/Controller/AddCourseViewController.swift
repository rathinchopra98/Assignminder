//
//  AddCourseViewController.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-18.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController {

    @IBOutlet weak var courseNameTxt: UITextField!
    @IBOutlet weak var courseCodeTxt: UITextField!
    @IBOutlet weak var addCourseBtn: UIButton!
    
    var courseArray = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCourseBtn.layer.cornerRadius = addCourseBtn.frame.size.height/2
        addCourseBtn.setShadow(opacity: 0.65, radius: 5.0)
    }
    
    @IBAction func courseNameTxtClick(_ sender: Any) {
        courseNameTxt.setShadow(opacity: 0.65, radius: 5.0)
        courseCodeTxt.setShadow(opacity: 0, radius: 0)
        
    }
    @IBAction func courseCodeTxtClick(_ sender: Any) {
        courseCodeTxt.setShadow(opacity: 0.65, radius: 5.0)
        courseNameTxt.setShadow(opacity: 0, radius: 0)
    }
    @IBAction func courseDescriptionClick(_ sender: Any) {
    }
    
    @IBAction func addCourse(_ sender: Any) {
        var course = Course(courseName: courseNameTxt.text ?? "0", courseCode: courseCodeTxt.text ?? "0")
        courseArray.append(course)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
