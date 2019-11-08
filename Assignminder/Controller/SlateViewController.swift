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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.delegate = self
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://slate.sheridancollege.ca/d2l/home")
        let myRequest = URLRequest(url: myURL!)
        webView.loadRequest(myRequest)
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {

        if(true){
            let URL = "https://slate.sheridancollege.ca/d2l/api/lp/1.10/enrollments/myenrollments/"
            
            // ALAMOFIRE function: get the data from the website
            Alamofire.request(URL, method: .get, parameters: nil).responseJSON {
                (response) in
                
                // -- put your code below this line
                
                if (response.result.isSuccess) {
                    print("awesome, i got a response from the website!")
                    
                    do {
                        let json = try JSON(data:response.data!)
                        //print("\(json["Items"][0]["OrgUnit"]["Name"])")
                        for item in json["Items"].arrayValue{
                            if(item["OrgUnit"]["Type"]["Name"] == "Course Offering"){
                                var course = Course(courseName: item["OrgUnit"]["Name"].stringValue, courseCode: item["OrgUnit"]["Code"].stringValue)
                                self.courseArray.append(course)
                            }
                        }
                        self.backBtn.sendActions(for: .touchUpInside)
                    }
                    catch {
                        print ("Error while parsing JSON response")
                    }
                    
                }
                
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
