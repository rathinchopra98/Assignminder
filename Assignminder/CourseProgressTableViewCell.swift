//
//  CourseProgressTableViewCell.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-12-12.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit

class CourseProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseIdLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
