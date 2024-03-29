//
//  AssignmentTableViewController.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-07.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit

class AssignmentTableViewController: UITableViewController {

    var assignmentsArrayTable = [Assignment]()
    var courseId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        self.tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ManualAssignmentViewController {
            assignmentsArrayTable = sourceViewController.assignments
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assignmentsArrayTable.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let changedDate = DateConverter()
        let randomColor = RandomColors()
        let cell = tableView.dequeueReusableCell(withIdentifier: "assignmentCell", for: indexPath)
            as! AssignmentTableViewCell

        // Configure the cell...
        cell.AssignmentLabel.text = assignmentsArrayTable[indexPath.row].assignmentName
        cell.dueDateLabel.text = changedDate.convertDateToString(dateToConvert: assignmentsArrayTable[indexPath.row].dueDate)
        cell.colorLabel.backgroundColor = randomColor.getRandomColor()
        
        if(assignmentsArrayTable[indexPath.row].priorityKey != 0){
            cell.gradeLabel.text = "Priority: \(assignmentsArrayTable[indexPath.row].priorityKey)"
        }
        else{
            cell.gradeLabel.text = "Marked"
        }
        
        return cell
    }
    
    @IBAction func addAssignment(_ sender: Any) {
        performSegue(withIdentifier: "manualAssignmentSegue", sender: nil)
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
        if(segue.identifier == "manualAssignmentSegue"){
            let assignmentPage = segue.destination as! ManualAssignmentViewController
            assignmentPage.assignments = self.assignmentsArrayTable
            assignmentPage.courseId = courseId
        }
    }
    

}
