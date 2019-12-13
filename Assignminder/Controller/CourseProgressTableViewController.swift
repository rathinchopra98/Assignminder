//
//  CourseProgressTableViewController.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-12-12.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit

class CourseProgressTableViewController: UITableViewController {
    var courseId = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CourseAndAssignmentInfo.courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let randomColor = RandomColors()
        let calculateProgress = CalculateCourseProgress()
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseProgressTableViewCell
        
        // Configure the cell...
        cell.courseNameLabel.text = CourseAndAssignmentInfo.courses[indexPath.row].courseName
        cell.courseIdLabel.text = CourseAndAssignmentInfo.courses[indexPath.row].courseCode
        cell.colorLabel.backgroundColor = randomColor.getRandomColor()
        
        let temp = CourseAndAssignmentInfo.assignments.filter {
            $0.courseId == CourseAndAssignmentInfo.courses[indexPath.row].courseCode
        }
        let result = calculateProgress.calculateCourseProgress(assignments: temp)
        
        cell.progressLabel.text = "\(round(result))%"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        courseId = CourseAndAssignmentInfo.courses[indexPath.row].courseCode
        performSegue(withIdentifier: "assignmentProgressSegue", sender: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "assignmentProgressSegue"){
            let childPage = segue.destination as! AssignmentProgressTableViewController
            childPage.courseId = self.courseId
        }
    }
    

}
