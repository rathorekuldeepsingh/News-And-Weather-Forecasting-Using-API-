//  Created by kuldeep singh on 6/29/17.

import UIKit

import FBSDKCoreKit
import CoreData
import FBSDKLoginKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    var nav:UINavigationController?
    
    var newsChannel = NewsTableViewController()
    
    
    
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        if UserDefaults.standard.bool(forKey: "isLogin") == true{

            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "TabBar") as! UIViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = initialViewControlleripad
            self.window?.makeKeyAndVisible()

            
        }
            
        else if UserDefaults.standard.bool(forKey: "isLogin") == false{
         
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "FacebookLoginViewController") as! UIViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = initialViewControlleripad
            self.window?.makeKeyAndVisible()
            
            
        }
        
        
//        self.decideRootController();
        return true
    }
    
    
//MARK:- Decide ViewController
//func decideRootController(){
//
//       var vc:UIViewController!
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//   
//        if UserDefaults.standard.bool(forKey: "isLogin") == false{
//            let tab = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBar") as! TabBar
//            self.window?.rootViewController = tab
//        }else{
//                vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FacebookLoginViewController") as! FacebookLoginViewController
//            
//                nav = UINavigationController.init(rootViewController: vc);
//                self.window?.rootViewController = nav
//        }
//       self.window?.makeKeyAndVisible()
//  }
//    
    
    
    func application(application : UIApplication, openURL url : URL ,sourceApplication:String?,annotation: Any) -> Bool {
 
        return  FBSDKApplicationDelegate.sharedInstance().application(application, open: url as URL!, sourceApplication: sourceApplication, annotation: annotation)
   }

    internal func application(_ app: UIApplication, open url : URL , options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
    let handeled  = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        return handeled
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}
