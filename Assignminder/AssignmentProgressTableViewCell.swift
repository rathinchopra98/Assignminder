//
//  AssignmentProgressTableViewCell.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-12-12.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit

class AssignmentProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var assignmentLabel: UILabel!
    @IBOutlet weak var marksLabel: UILabel!
    @IBOutlet weak var colorsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
