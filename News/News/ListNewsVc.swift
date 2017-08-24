//
//  ListNewsVc.swift
//  News
//
//  Created by kuldeep singh on 7/16/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.
//

import UIKit
import SideMenu
class ListNewsVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func menuTaped(_ sender: Any) {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //
       // Config.setLeftSlider()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        //
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
