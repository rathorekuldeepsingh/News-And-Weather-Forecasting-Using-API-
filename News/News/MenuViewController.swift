//
//  MenuViewController.swift
//  News
//
//  Created by kuldeep singh on 7/14/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var lblProfileName: UILabel!
    @IBOutlet var dp: UIImageView!
    @IBOutlet var menuContent: UITableView!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var btnLogout: UIButton!

    var vcNews:NewsTableViewController!
    var newsChannel = NewsTableViewController()
    var categories  = ["All","General","Technology","Sport","Business","Politics","Entertainment","Gaming","Music","Science-And-Nature"]
    
    var profileName    = UserDefaults.standard.string(forKey: "name")
    var email          = UserDefaults.standard.string(forKey: "email")
    var header:String! = "Categories"
    var myIndex:Int?
    var sourceObject:[NewsSource] = [NewsSource]()
    var filter = [String]()
    

//MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true;
        
        // Function for Round Image
        dp.layer.cornerRadius = dp.frame.height / 2
        dp.clipsToBounds = true
        
        // passing value to label
        lblProfileName.text = profileName
        lblEmail.text       = email
        
        if (UserDefaults.standard.string(forKey: "profilePictureURL"))  != nil {
            dp.downloadImage(from: (UserDefaults.standard.string(forKey: "profilePictureURL") ?? ""))
            print(UserDefaults.standard.string(forKey: "profilePictureURL") ?? "")
            
            }
    
//        // Making Login Button
//        let btnLogout = FBSDKLoginButton()
//        btnLogout.frame = CGRect(x: 0, y: view.frame.height - 30, width: view.frame.width-100, height: 30)
//        view.addSubview(btnLogout)
//        btnLogout.backgroundColor = .red
//        btnLogout.delegate = self
    }


//MARK:- Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
//MARK:- Table View Data Source Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
      return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let cell =  tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
      }
    

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          var capitalizedArray = categories.map { $0.lowercased()}
            capitalizedArray.append(contentsOf: categories)
            categories = capitalizedArray
            myIndex = indexPath.row

        vcNews.selectedNews.removeAll()  //firest remove everything
        
        if indexPath.row == 0{
            vcNews.selectedNews = vcNews.newsSources;
            vcNews.newsTableVc.reloadData();
            self.dismiss(animated: true, completion: nil);
        return
        }
        
        //filling
        if vcNews.selectedNews.count == 0{
    
            for item in vcNews.newsSources {
            if item.categorie == categories[indexPath.row]{
                vcNews.selectedNews.append(item);
            }
          }
        }
        vcNews.newsTableVc.reloadData();
        self.dismiss(animated: true, completion: nil);
    }
    

//MARK :- gvfFacebook Logout
    @IBAction func btnSignOut(_ sender: FBSDKLoginButton) {
        print("Successfully Logout")

        UserDefaults.standard.removeObject(forKey: "isLogin")
        print(UserDefaults.standard.bool(forKey: "isLogin"))
        lblProfileName.text = ""
        lblEmail.text       = ""
        dp.image            = nil

        func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
            if error != nil {
                print("Can't login Having some error : ",error!)
                return
            }
            print("Logged in")
            var  isLogin = true
            UserDefaults.standard.set(isLogin, forKey: "isLogin")
        }
        
        
    //MARK :- Facebook Logout
        func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
           
            print("Successfully Logout")
            
//            UserDefaults.standard.removeObject(forKey: "isLogin")
//            print(UserDefaults.standard.bool(forKey: "isLogin"))
//            lblProfileName.text = ""
//            lblEmail.text       = ""
//            dp.image            = nil
        }
    }
}
