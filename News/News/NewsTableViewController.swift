//  Created by kuldeep singh on 6/29/17.

import UIKit
import FBSDKLoginKit
import SideMenu
import MBProgressHUD

class NewsTableViewController: UITableViewController {

    let  newsFeed  = NewsFeedTableViewController()
    var newsSources :[NewsSource] = [NewsSource]()
    var selectedNews:[NewsSource] = [NewsSource]()
    static var indicator:Bool = false
    var myIndex: Int = 0

//MARK:- Outlets
    @IBOutlet var btnBarFavInNews: UIBarButtonItem!
    @IBOutlet var buttonMenu: UIBarButtonItem!
    @IBOutlet var newsTableVc: UITableView!
   

//MARK:- View Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        Config.setLeftSlider(vc:self);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Config.setLeftSlider(vc:self);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Config.setLeftSlider(vc:self);
    //Starting Activity Indicator
        let hud = MBProgressHUD.showAdded(to: self.view, animated:true)
        hud.label.text = "Loading"
        hud.center = view.center
        hud.isUserInteractionEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if NewsTableViewController.indicator == false{
            ApiManager.sharedInstance.gettingSource(success: {(newsSources) in
                self.newsSources = newsSources
                DispatchQueue.main.async {
                    self.selectedNews = newsSources;
                    self.newsTableVc.reloadData()
                    
                    // Stoping Activity Indicator
                    MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                }
            })
            {(error) in
                print("error")
            }
        }
    }

    
// MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedNews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as!NewsTableViewCell
            cell.lblUrl?.text       = self.selectedNews[indexPath.row].webUrl
            cell.lblWebSource?.text = self.selectedNews[indexPath.row].nameTitle
            return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.item
        performSegue(withIdentifier: "newsVcToNewsFeedVc", sender: self)
    }
    
    
    //MARK:- seague method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    if segue.identifier == "newsVcToNewsFeedVc"{
        let setValue = segue.destination as! NewsFeedTableViewController
            setValue.ttlName  = (self.selectedNews[myIndex].nameTitle)!
            setValue.sourceId = (self.selectedNews[myIndex].idTitle)!
        }else if segue.identifier == "sourcesToFavorite"{
        }
    }
    
    
//MARK:- Action
    @IBAction func btnMenuTaped(_ sender: Any) {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
//  share Button
    @IBAction func btnFavorite(_ sender: UIBarButtonItem) {
       performSegue(withIdentifier: "sourcesToFavorite", sender: self)

    }
}
