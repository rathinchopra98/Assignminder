//
//  SlateViewController.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-07.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON

class SlateViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    var courseArray = [Course]()
    var assignmentArray = [Assignment]()
    let myGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://slate.sheridancollege.ca/d2l/home")
        let myRequest = URLRequest(url: myURL!)
        webView.loadRequest(myRequest)
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.getCourses()
    }
    
    func getCourses(){
        let URL = "https://slate.sheridancollege.ca/d2l/api/lp/1.10/enrollments/myenrollments/"
        
        // ALAMOFIRE function: get the data from the website
        Alamofire.request(URL, method: .get, parameters: nil).responseJSON {
            (response) in
            
            if (response.result.isSuccess) {
                
                do {
                    let json = try JSON(data:response.data!)
                    //print("\(json["Items"][0]["OrgUnit"]["Name"])")
                    for item in json["Items"].arrayValue{
                        if(item["OrgUnit"]["Type"]["Name"] == "Course Offering"){
                            let course = Course(courseName: item["OrgUnit"]["Name"].stringValue, courseCode: item["OrgUnit"]["Id"].stringValue, courseDescription: "NULL")
                            self.courseArray.append(course)
                        }
                    }
                    self.getAssignments()
                }
                catch {
                    print ("Error while parsing JSON response")
                }
                
            }
            
        }
    }
    
    func getAssignments(){
        let dateConverter = DateConverter()
        for object in courseArray{
            myGroup.enter()
            let URL = "https://slate.sheridancollege.ca/d2l/api/le/1.10/\(object.courseCode)/grades/"
            
            // ALAMOFIRE function: get the data from the website
            Alamofire.request(URL, method: .get, parameters: nil).responseJSON {
                (response) in
                if (response.result.isSuccess) {
                    
                    do {
                        let json = try JSON(data:response.data!)
                        for item in json.arrayValue{
                            let assignment = Assignment(assignmentName: item["Name"].stringValue, dueDate: dateConverter.convertStringToDate(dateChange: "2019-09-09T03:59:00.000Z"), courseId: object.courseCode, userId: "rc@gmail.com", grade: 0, priorityKey: 0, weightage: Float(item["Weight"].stringValue)! )
                            self.assignmentArray.append(assignment)
                        }
                    }
                    catch {
                        print ("Error while parsing JSON response")
                    }
                    
                }
                self.myGroup.leave()
            }
        }
        myGroup.notify(queue: .main) {
            self.getGradesForAssignments()
        }
    }
    
    func getGradesForAssignments(){
        let dateConverter = DateConverter()
        let coursePrioritization = CoursePrioritization()
        
        for object in courseArray{
            myGroup.enter()
            var tempAssignments = [Assignment]()
            let URL = "https://slate.sheridancollege.ca/d2l/api/le/1.10/\(object.courseCode)/grades/values/myGradeValues/"
            
            // ALAMOFIRE function: get the data from the website
            Alamofire.request(URL, method: .get, parameters: nil).responseJSON {
                (response) in
                if (response.result.isSuccess) {
                    
                    do {
                        let json = try JSON(data:response.data!)
                        for item in json.arrayValue{
                            let assignment = Assignment(assignmentName: item["GradeObjectName"].stringValue, dueDate: dateConverter.convertStringToDate(dateChange: "2019-09-09T03:59:00.000Z"), courseId: object.courseCode, userId: "rc@gmail.com", grade: Float(item["WeightedNumerator"].stringValue) ?? 0, priorityKey: 0, weightage: Float(item["WeightedDenominator"].stringValue) ?? 0 )
                            tempAssignments.append(assignment)
                        }
                    }
                    catch {
                        print ("Error while parsing JSON response")
                    }
                }
                let temp = self.assignmentArray.filter {
                    $0.courseId == object.courseCode
                }
                for item in temp{
                    let gradeName = tempAssignments.filter{$0.assignmentName == item.assignmentName}.first
                    if(gradeName != nil){
                        self.assignmentArray.first(where: { $0.assignmentName == gradeName?.assignmentName && $0.courseId == gradeName?.courseId })?.grade = gradeName?.grade ?? 0
                    }
                }
                
                self.assignmentArray = coursePrioritization.priortizeAssignments(assignments: self.assignmentArray, courses: self.courseArray)
                CourseAndAssignmentInfo.assignments = self.assignmentArray
                CourseAndAssignmentInfo.courses = self.courseArray
                
                self.myGroup.leave()
            }
        }
        myGroup.notify(queue: .main) {
            self.backBtn.sendActions(for: .touchUpInside)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
