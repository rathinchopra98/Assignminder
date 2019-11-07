//
//  ViewController.swift
//  Assignminder
//
//  Created by Rathin Chopra and Salim Elewa on 2019-11-06.
//  Copyright © 2019 Rathin Chopra and Salim Elewa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var siginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        siginBtn.layer.cornerRadius = siginBtn.frame.size.height/2
        
        siginBtn.setShadow(opacity: 0.65, radius: 5.0)
        emailTextBox.setShadow(opacity: 0.25, radius: 5.0)
        passwordTextBox.setShadow(opacity: 0.25, radius: 5.0)
        
        //setting the gradient background
        view.setGradientBackground(colorOne: Colors.loginColorOne, colorTwo: Colors.loginColorTwo)
    }
}

