
//  Created by kuldeep singh on 6/26/17.

import UIKit
import CoreLocation
import MBProgressHUD

class CityReportTableViewController: UITableViewController,UISearchBarDelegate {
    
    var savingFbData:[FacebookData] = [FacebookData]()
    var weatherClassObject = [WeatherData]()

    @IBOutlet var menu: UIBarButtonItem!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var a: UITableView!
    @IBOutlet var weatherTblVc: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      searchBar.delegate = self

        let spinner = MBProgressHUD.showAdded(to: self.view, animated: true)
        spinner.label.text = "Lading"
        spinner.center = view.center
        
        updateWeatherForLocation(location: "Jaipur")
 
    }
    
// MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return weatherClassObject.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Calendar.current.date(byAdding: .day, value: section, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date!)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let obj = weatherClassObject[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! WeatherCell
        cell.lblSummary.text       = self.weatherClassObject[indexPath.section].status
        cell.lblTemperature.text   = "\((self.weatherClassObject[indexPath.section].temerature!))°F"
        cell.icon.image            = UIImage(named: obj.icon!)
        return cell
    }
    
    @IBAction func menu(_ sender: UIBarButtonItem) {
}
    
//MARK :- func searchbar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text, !locationString.isEmpty {
            updateWeatherForLocation(location: locationString)
        }
    }
    
    

//    MARK :- func update locaion
    func updateWeatherForLocation (location:String) {
        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error:Error?) in
            
            if error == nil {
                if let location = placemarks?.first?.location {
                    ApiManager.sharedInstance.weatherData(location: location.coordinate, sucess: {(WeatherData) in
                        self.weatherClassObject = WeatherData
                        DispatchQueue.main.async {
                            self.weatherTblVc.reloadData()
                        }
                    }, failure: {(error) in
                    print("error location")
                    })
                   MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
            }
         }
      }
   }
}
