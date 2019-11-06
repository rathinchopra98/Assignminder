//
//  ViewController.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-06.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setting the gradient background
        view.setGradientBackground(colorOne: Colors.loginColorOne, colorTwo: Colors.loginColorTwo)
    }
}

