//
//  MenuViewViewController.swift
//  News
//
//  Created by kuldeep singh on 7/10/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.
//

import UIKit

class MenuViewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // outlets
    @IBOutlet weak var tableView: UITableView!
    
    // data
    let segues = ["option 1", "option 2", "option 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // MARK: UITableViewDelegate&DataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        
        cell.textLabel?.text = segues[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let nvc = self.mainTabBarController()
//        
//        if let hamburguerViewController = self.findHamburguerViewController() {
//            
//            hamburguerViewController.hideMenuViewControllerWithCompletion({ () -> Void in
//                
//          //      nvc.visibleViewController?.performSegue(withIdentifier: self.segues[(indexPath as NSIndexPath).row], sender: nil)
//                hamburguerViewController.contentViewController = nvc
//            })
//        }
    }
 
    // MARK: - Navigation
    
    func mainTabBarController() -> TabbarController {
        return self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as! TabbarController
    }
}



