//  Created by kuldeep singh on 7/10/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.

import Foundation

import UIKit

class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(TabbarController.panGestureRecognized(_:))))
    }
    
    func panGestureRecognized(_ sender: UIPanGestureRecognizer!) {
    
        // dismiss keyboard
//        self.view.endEditing(true)
//        self.findHamburguerViewController()?.view.endEditing(true)
//        
//        
//        // pass gesture to hamburguer view controller.
//        self.findHamburguerViewController()?.panGestureRecognized(sender)
//    }
    
}
}
