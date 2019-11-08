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
                            let course = Course(courseName: item["OrgUnit"]["Name"].stringValue, courseCode: item["OrgUnit"]["Id"].stringValue)
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
        for object in courseArray{
            myGroup.enter()
            let URL = "https://slate.sheridancollege.ca/d2l/api/le/1.10/\(object.courseCode)/dropbox/folders/"
            
            // ALAMOFIRE function: get the data from the website
            Alamofire.request(URL, method: .get, parameters: nil).responseJSON {
                (response) in
                if (response.result.isSuccess) {
                    
                    do {
                        let json = try JSON(data:response.data!)
                        for item in json.arrayValue{
                            let assignment = Assignment(assignmentName: item["Name"].stringValue, dueDate: item["DueDate"].stringValue, courseId: object.courseCode)
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
            self.backBtn.sendActions(for: .touchUpInside)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
