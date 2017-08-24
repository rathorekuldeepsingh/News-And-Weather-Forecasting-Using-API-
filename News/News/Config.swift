//
//  Config.swift
//  News
//
//  Created by kuldeep singh on 7/16/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit
import SideMenu
import AVFoundation
class Config{
    
    
//MARK:- SideMenu  methods for application ..
    public static func  setLeftSlider(vc:NewsTableViewController){
        let vcLeft = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        vcLeft.vcNews = vc;
        
        
        let navLeft:UISideMenuNavigationController      = UISideMenuNavigationController.init(rootViewController: vcLeft)
        SideMenuManager.menuLeftNavigationController    = navLeft;
        SideMenuManager.menuFadeStatusBar               = false;
        SideMenuManager.menuPresentMode                 = .viewSlideOut
    }
   
    
//MARK:- Decide ViewController
//    class func decideRootController(){
//        
//        var vc:UIViewController!
//        
//        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
//        
//        
//        
//        if UserDefaults.standard.bool(forKey: "isLogin") == false{
//            
//            vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavController") as! NavController
//            
//            appDelegate.nav = UINavigationController.init(rootViewController: vc);
//            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
//            appDelegate.window?.rootViewController = vc
//            appDelegate.window?.makeKeyAndVisible()
//            
//            
//        }else{
//            vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FacebookLoginViewController") as! FacebookLoginViewController
//            
//            appDelegate.nav = UINavigationController.init(rootViewController: vc);
//            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
//            appDelegate.window?.rootViewController = appDelegate.nav
//            appDelegate.window?.makeKeyAndVisible()
//            
//        }
//    }
    
    
}
