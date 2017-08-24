//  Created by kuldeep singh on 7/6/17.
//  Copyright © 2017 kuldeep singh. All rights reserved.

import UIKit

class favoriteTblVc: UITableViewController {

    var savedData = [FavoriteDataStructure]()
    var favIndex:Int = 0

// MARK: -  View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
   }

// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ApiManager.countRef
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! favoriteCell
            cell.lblFavoriteTitle.text       = UserDefaults.standard.string(forKey: "ttl\(indexPath.row)")
            cell.lblFavoriteDescription.text = UserDefaults.standard.string(forKey: "desc\(indexPath.row)")
            cell.favoriteImage.downloadImage(from: (UserDefaults.standard.string(forKey: "imageUrl\(indexPath.row)"))!)
            return cell
    }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         favIndex = indexPath.row
         performSegue(withIdentifier: "fromFavToWebView", sender: self)
    }

//MARK:- Seague Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webUrlInFav        = segue.destination as! NewsDetailViewController
            webUrlInFav.webUrl     = UserDefaults.standard.string(forKey: "url\(favIndex)")!
            webUrlInFav.isFavorite = true
    }
}
