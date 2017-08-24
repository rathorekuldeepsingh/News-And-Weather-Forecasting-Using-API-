//
//  ViewController.swift
//  FacebookLogin
//
//  Created by kuldeep singh on 7/9/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let loginButton:FBSDKLoginButton = {
      let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
        loginButton.center = view.center
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

