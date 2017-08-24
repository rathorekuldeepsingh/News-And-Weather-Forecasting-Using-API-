//  Created by kuldeep singh on 7/5/17.

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet var FavoriteWebView: UIWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let defaults = UserDefaults.standard
        let webUrlSaved = defaults.string(forKey: "webUrl")
        let url = URL(string: webUrlSaved!)
        FavoriteWebView.loadRequest(URLRequest(url : url!))


    }
    
    @IBAction func btnDone(_ sender: UIBarButtonItem) {
    
    }

  
}
