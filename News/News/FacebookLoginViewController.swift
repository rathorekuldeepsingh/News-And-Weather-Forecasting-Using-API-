//  Created by kuldeep singh on 7/9/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class FacebookLoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    var isLogin:Bool = false

//MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Making Login Button
        let loginButton = FBSDKLoginButton()
            loginButton.frame = CGRect(x: 16, y: view.frame.height/2 + 30, width: view.frame.width-32, height: 50)
            loginButton.delegate = self
            loginButton.center = view.center
        view.addSubview(loginButton)
        fetchProfile()
     }
 
    
//MARK:- Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


//MARK :- Facebook Login
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
                if error != nil {
                    print("Can't login Having some error : ",error!)
                    return
                }
         print("Logged in")
        fetchProfile()

        isLogin = true
        UserDefaults.standard.set(isLogin, forKey: "isLogin")
        print(UserDefaults.standard.bool(forKey: "isLogin"))
        performSegue(withIdentifier: "fbToHome", sender: self)
   }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
     }
            
   //MARK :- Facebook Logout
        func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
                print("Successfully Logout")
            }
    }

    func fetchProfile(){
        let parameters = ["fields": "id, name, email, picture "]
        FBSDKGraphRequest(graphPath: "me", parameters:parameters).start{ (connection,result,error) -> Void in
            
            if (error != nil){
                print(error ?? "error in feching profile")
                return
            }
            else{
                do{
                   let data:[String:AnyObject] = result as! [String : AnyObject]
                     if let name = data["name"] as? String,let email = data["email"] as? String , let profilePictureURL = (data["picture"]!["data"]!! as! [String : AnyObject])["url"]{
                        UserDefaults.standard.set(name, forKey: "name")
                        UserDefaults.standard.set(email, forKey: "email")
                        UserDefaults.standard.set(profilePictureURL, forKey: "profilePictureURL")
                        }
                      print(UserDefaults.standard.string(forKey: "name") ?? "")
                   }
                }
            }
        }


