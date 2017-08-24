//  Created by kuldeep singh on 6/29/17.

import UIKit
import MBProgressHUD

class NewsFeedTableViewController: UITableViewController {

      var articles:[Article]? = []
      var sourceId  = ""
      var ttlName   = ""
      var index:Int = 0
      let vc = NewsDetailViewController()
      var selectedNews:[NewsSource]? = [NewsSource]()
      var objFav:FavoriteDataStructure = FavoriteDataStructure()
    
//MARK:- Outlets
    @IBOutlet var newsFeedTblVc: UITableView!
    
//MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
        newsFeedTblVc.estimatedRowHeight = 23
        newsFeedTblVc.rowHeight = UITableViewAutomaticDimension
        self.navigationItem.title = ttlName
        NewsTableViewController.indicator = true
        
   // Starting Activity Indicator
         let spinner        = MBProgressHUD.showAdded(to: self.view, animated: true)
         spinner.label.text = "Lading"
         spinner.center     = view.center
   }
    
    override func viewWillAppear(_ animated: Bool) {
        ApiManager.sharedInstance.gettingArticles(sourceId: sourceId, sucess: {(articles) in
            self.articles = articles
            
            DispatchQueue.main.async {
            self.newsFeedTblVc.reloadData()
            
   // Stoping Activity Indicator
             let busyIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
             busyIndicator.hidesWhenStopped = true
             busyIndicator.stopAnimating()
             self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: busyIndicator)
            MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                
            }
        }) { (error) in
                print("error in news fees vc")}
      }

// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "newsFeedCell", for: indexPath) as! NewsFeedCell
          cell.lblTitle.text         =  self.articles?[indexPath.item].ttl
          cell.lblDescription.text   =  self.articles?[indexPath.item].desc
          cell.newsImage.downloadImage(from: (self.articles?[indexPath.item].imageUrl!)!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
       performSegue(withIdentifier: "newsFeedToNewsDetail", sender: self)
    }

//MARK:- Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsFeedToNewsDetail" {
        let valueUrl = segue.destination as! NewsDetailViewController
            valueUrl.ttlName       = self.ttlName
            valueUrl.webUrl        = (self.articles?[index].url)!
            valueUrl.dataToBeSaved = self.articles?[index]
       }
    }
    func x(){
         NewsTableViewController.indicator = true
    }
}
