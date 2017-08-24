//  Created by kuldeep singh on 7/1/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.

import UIKit
import MBProgressHUD

class NewsDetailViewController: UIViewController {

    var webUrl = ""
    var ttlName  = ""
    var dataToBeSaved:Article!
    var isFavorite:Bool = false
    var structData = [FavoriteDataStructure]()

//MARK:- Outlets
    @IBOutlet var myWebView: UIWebView!
    @IBOutlet var outletFavBtn: UIBarButtonItem!

//MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationItem.title = ttlName
        
        let url = URL(string : webUrl)
        myWebView.loadRequest(URLRequest(url : url!))
       
         let spinner        = MBProgressHUD.showAdded(to: self.view , animated: true)
             spinner.label.text = "Loading"
             spinner.center     = view.center
      }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute:{
        MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
        })
        if isFavorite {
         outletFavBtn.image = #imageLiteral(resourceName: "favorite.png")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

//MARK:- Action
    @IBAction func btnShare(_ sender: UIBarButtonItem) {
        // UIActivityController
        let activityVc = UIActivityViewController(activityItems: [dataToBeSaved.ttl,dataToBeSaved.url], applicationActivities: nil)
        activityVc.popoverPresentationController?.sourceView = self.view
        self.present(activityVc, animated: true, completion: nil)
    }
    
    @IBAction func btnFavorite(_ sender: UIBarButtonItem) {

        outletFavBtn.image = #imageLiteral(resourceName: "favorite.png")
        
   // User Defaults Methods
        UserDefaults.standard.set(dataToBeSaved!.ttl,     forKey: "ttl\(ApiManager.countRef)")
        UserDefaults.standard.set(dataToBeSaved!.desc,    forKey: "desc\(ApiManager.countRef)")
        UserDefaults.standard.set(dataToBeSaved!.url,     forKey: "url\(ApiManager.countRef)")
        UserDefaults.standard.set(dataToBeSaved.imageUrl, forKey: "imageUrl\(ApiManager.countRef)")

        ApiManager.countRef += 1
        print(ApiManager.countRef)
    }
}
