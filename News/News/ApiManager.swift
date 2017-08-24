//  Created by kuldeep singh on 7/2/17.


import UIKit
import CoreLocation

/* Source Object  */

class NewsSource: NSObject {
        var idTitle   : String?
        var imgInNews : String?
        var webUrl    : String?
        var nameTitle : String?
        var categorie : String?
}

/* Articles Object */

class Article: NSObject {
 
        var ttl      : String?
        var desc     : String?
        var url      : String?
        var imageUrl : String?
}



/* Weather data Object  */
class WeatherData{
        var temerature : Double?
        var status     : String?
        var icon       : String?
    
}

//MARK:- structure to set favorite data
    struct FavoriteDataStructure {
    
        var webUrl = ""
        var ttlForFavorite   : String?
        var descForFavorite  : String?
        var imageForFavorite : String?
}


//MARK:- Singletone Class For Managing API
class ApiManager: NSObject {

        static var  countRef:Int   =  0
        static let  sharedInstance =  ApiManager()
    
        var host = "https://newsapi.org/v1/"

//MARK:- function for source(Channel list)
    func gettingSource( success:@escaping ([NewsSource]) -> Void , failture: @escaping (String) ->Void  ) {
              var newsSources  =   [NewsSource]()
              let urlString    =   String(format: "%@sources?language=en", host)
              let urlRequest   =   URLRequest(url: URL(string: urlString)!)
              let task         =   URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil{
                print("error json parsing")
            }
            else{
                do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                   if let sourcesInJson = json["sources"] as? [[String: AnyObject]]{
                      for eachSource in sourcesInJson {
                         let newsSource = NewsSource()
                            if let title = eachSource["id"] as? String, let url = eachSource["url"] as? String,let nameTitle = eachSource["name"] as? String,let categorie = eachSource["category"] as? String{
                                
                                newsSource.idTitle   =  title
                                newsSource.nameTitle =  nameTitle
                                newsSource.webUrl    =  url
                                newsSource.categorie =  categorie
                            
                            }
                           newsSources.append(newsSource)
                        }
                        success(newsSources)
                    }
                }
                catch let error{
                    print(error.localizedDescription)
                    failture(error.localizedDescription)
                }
             }
          }
       task.resume()
    }
    
//* Getting data(Articles) from from News Source */
        func gettingArticles(sourceId:(String) , sucess:@escaping ([Article]) -> Void , failture:@escaping (String) -> Void ) {
        
             var articles = [Article]()
            let newsFeedUrlString = String(format: "%@articles?source=\(sourceId)&apiKey=2cba80f5df7d423eaa48e5d3b51a51db",host )
            let urlRequest =  URLRequest(url: URL(string: newsFeedUrlString)!)
        
            let task       =  URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
            
            if error != nil{
                print("error")
            }
            else{
                do{
                  let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:AnyObject]
                    
                    if let articlesInJson = json["articles"] as? [[String:AnyObject]]
                      {
                        for eachArticle in articlesInJson {
                           let article = Article()
                            
                            if let title = eachArticle["title"] as? String, let description = eachArticle["description"] as? String, let url = eachArticle["url"] as? String,  let imageUrl = eachArticle["urlToImage"] as? String{
                                
                                article.ttl     =  title
                                article.desc    =  description
                                article.url     =  url
                                article.imageUrl =  imageUrl
                              }
                              articles.append(article)
                            }
                      sucess(articles)
                    }
                 }
               catch let error{
                   print(error.localizedDescription)
                   failture(error.localizedDescription)
               }
            }
         }
       task.resume()
    }


/* Function For Getting data Of Weather From Json */
    func weatherData(location: CLLocationCoordinate2D   , sucess:@escaping([WeatherData]) -> Void , failure:@escaping(String) -> Void){
    
       var weatherObject = [WeatherData]()
    
         let urlRequest = URLRequest(url: URL(string: "https://api.darksky.net/forecast/c961a1caa5c41989cb307d483e1c6c43/\(location.latitude),\(location.longitude)")!)
           let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
             if error != nil{
              print("error in weather data")
              }
                else{
                  do{
                   let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                
                     if let daily = json["daily"] as? [String: AnyObject]{
                      if let dailyData = daily["data"] as? [[String:AnyObject]]{
                        
                         for dataPoint in dailyData{
                       
                           let weatherObj = WeatherData()
                        
                             if let summaryFromJson = dataPoint["summary"] as? String , let temperatureFromJson = dataPoint["temperatureMax"] as? Double , let iconFromJson = dataPoint["icon"] as? String {
                            
                               weatherObj.temerature = temperatureFromJson
                               weatherObj.status     = summaryFromJson
                               weatherObj.icon       = iconFromJson
                            }
                          weatherObject.append(weatherObj)
                        }
                      sucess(weatherObject)
                   }
                }
             }
           catch let error {
              print(error.localizedDescription)
              failure(error.localizedDescription)
            }
         }
      }
    task.resume()
  }

}//ending of ApiManager Class



//MARK:-  Function for image Acessing from url
   extension UIImageView {
        func downloadImage(from url : String){
          let urlRequest = URLRequest(url: URL(string: url)!)
          
            let task       = URLSession.shared.dataTask(with: urlRequest) {(data,response,error) in
              if error != nil{
                  print("error")
                   return
                 }
                   else {
                      DispatchQueue.main.async {
                      self.image = UIImage(data:data!)
                  }
               }
            }
         task.resume()
      }
  }
