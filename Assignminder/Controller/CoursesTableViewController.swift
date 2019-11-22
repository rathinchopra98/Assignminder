//
//  CoursesTableViewController.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-06.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit

class CoursesTableViewController: UITableViewController {

    var courses = [Course]()
    var assignments = [Assignment]()
    var courseId: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.rowHeight = 60
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    @IBAction func addCourseManuallyBtn(_ sender: Any) {
        performSegue(withIdentifier: "addCourseSegue", sender: nil)
    }
    
    @IBAction func slateBtnPress(_ sender: Any) {
        performSegue(withIdentifier: "slateSegue", sender: nil)
    }
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? SlateViewController {
            courses = sourceViewController.courseArray
            assignments = sourceViewController.assignmentArray
        }
        else if let sourceViewController = sender.source as? AddCourseViewController{
            courses = sourceViewController.courseArray
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let randomColor = RandomColors()
        let cell = tableView.dequeueReusableCell(withIdentifier: "coursesCell", for: indexPath)
            as! CoursesTableViewCell

        // Configure the cell...
        cell.coursesLabel.text = courses[indexPath.row].courseName
        cell.courseCodeLabel.text = courses[indexPath.row].courseCode
        cell.colorLabel.backgroundColor = randomColor.getRandomColor()
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.courseId = courses[indexPath.row].courseCode
        performSegue(withIdentifier: "assignmentSegue", sender: nil)
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
        if(segue.identifier == "assignmentSegue"){
            let childPage = segue.destination as! AssignmentTableViewController
            var newAssignments = [Assignment]()
            for item in assignments{
                if(item.courseId == self.courseId){
                    newAssignments.append(item)
                }
            }
            childPage.assignmentsArrayTable = newAssignments
        }
        else if(segue.identifier == "addCourseSegue"){
            let childPage = segue.destination as! AddCourseViewController
            childPage.courseArray = courses
        }
        else if(segue.identifier == "slateSegue"){
            let childPage = segue.destination as! SlateViewController
            childPage.courseArray = courses
        }
    }
    

}
