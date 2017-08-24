//////  Created by kuldeep singh on 7/4/17.
////
////import Foundation
//
//class WeatherData : NSObject {
//
//    var temperature: Double?
//    var summary: String?
//    var descriptiveImage: String?
//}
//
//class WeatherApi: NSObject{
//
//
//func featchingWeatherApiData(sucess:@escaping([WeatherData]) -> Void,failture: @escaping(String) -> Void){
//
//let urlRequest = URLRequest(url: URL(string: "https://api.darksky.net/forecast/c961a1caa5c41989cb307d483e1c6c43/37.8267,-122.4233")!)
//
//let task       = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//
//    if error != nil{
//        print("Error In Weather")
//    }
//
//    else{
//        do{
//            print("I am in")
//
//            self.weatherDataInArray = [Weather]()
//
//            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
//
//            if let dataInJson = json["daily"] as? [String: AnyObject]{
//
//                if let dailyForcast = dataInJson["data"] as? [[String: AnyObject]]{
//
//                    for eachDataPoint in dailyForcast{
//
//                        let eachDataOfWeather = Weather()
//
//                        if let summary = eachDataPoint["summary"] as? String,let icon = eachDataPoint["icon"] as? String,let temperature = eachDataPoint["temperatureMax"] as? Double {
//
//                            eachDataOfWeather.temperature      = temperature
//                            eachDataOfWeather.summary          = summary
//                            eachDataOfWeather.descriptiveImage = icon
//                        }
//                        self.weatherDataInArray?.append(eachDataOfWeather)
//                    }
//                    DispatchQueue.main.async {
//                        self.weatherTblVc.reloadData()
//                    }
//                }
//            }
//        }
//        catch let error {
//            print("error while fechinf json")
//        }
//    }
//}
//task.resume()
//print("I am out")
//}
//}
//
