//
//  MainCharacterViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit


//this is a episode  main viewcontroller which fetch data of different endpoints of episode and store in lists for show in table view controllers and view controllers of different endpoints.All the different endpoints screens start from buttons present in this view controller.
class MainEpisodeViewController: UIViewController {

    ///lists to store data
    var episodeList = EpisodeList()
    var episodeListSeries = EpisodeList()
    var episodeByIdList = EpisodeList()
    var episode: Episode!
    
    
    //different endpoint url strings
    var allUrl = "https://www.breakingbadapi.com/api/episodes";
    var seriesUrl = "https://www.breakingbadapi.com/api/episodes?series=Better+Call+Saul"
    var episodeByIdUrl = "https://www.breakingbadapi.com/api/episodes/60"
    
   // var myArray = [Character]()
    
    
    //same method with url and type to fetch data from different endpoints called in view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(url: allUrl,type: "all")
        getData(url: seriesUrl, type: "series")
        getData(url: episodeByIdUrl, type: "byid")
       
        // Do any additional setup after loading the view.
    }
    
    //fetch data and store in lists
    func getData(url: String , type:String){
        var yourArray = [Episode]()
        
        let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
        let fileUrl = URL(string: url)
        let request = URLRequest(url: fileUrl!)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            print("        ")
            print("        ")
            print("Fetching Data From breaking bad Wait.....")
            
            if let jsonData = data{
               do {
                  let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
              
                
                //to convert json object into json string --> start here
                let data1 = try JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions.prettyPrinted)
                let jsonText = String(data: data1, encoding: String.Encoding.utf8) as NSString? ?? ""
                //to convert json object into json string --> end here
                
                
               //print(jsonText)  //we can display json data using this if we want to see, i hide for space issue
                
                //to convert json string into dictionary of objects --> start here
                let string = String(jsonText)
                let data = string.data(using: .utf8)!
                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
                    {
                   
                        print(jsonArray.count)
                        for single in jsonArray{
                        
                            let episode_id = String(single["episode_id"]! as! Int);
                            let season = String(single["season"]! as! String);
                            let episode = String(single["episode"]! as! String);
                          
                            yourArray.append( Episode(episode_id: episode_id as! String,title: single["title"]! as! String,season: season as! String,air_date: single["air_date"]! as! String,characters: single["title"]! as! String,episode: episode as! String,series: single["series"]! as! String));
                        }
                    } else {
                        print("bad json string")
                    }
                    
                    for s in yourArray{
                        let eid: String? = s.episode_id
                        let tit: String? = s.title
                        let sea: String? = s.season
                        let ad: String? = s.air_date
                        let chars: String? = s.characters
                        let e: String? = s.episode
                        let ser: String? = s.series
                        
                            if eid != nil && tit != nil && sea != nil && ad != nil && chars != nil && e != nil && ser != nil {
                            //print(a!)
                                
                                if (type == "all"){
                                    self.episodeList.list.append(Episode(episode_id: eid!,title:tit!,season: sea!,air_date: ad!,characters: chars!,episode: e!,series:ser!))
                                }
                                if (type == "series"){
                                    self.episodeListSeries.list.append(Episode(episode_id: eid!,title:tit!,season: sea!,air_date: ad!,characters: chars!,episode: e!,series:ser!))
                                }
                                if (type == "byid"){
                                    self.episodeByIdList.list.append(Episode(episode_id: eid!,title:tit!,season: sea!,air_date: ad!,characters: chars!,episode: e!,series:ser!))
                                }
                                
                            }
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
               
                //to convert json string into dictionary of objects--->end here
        
                
                
                } catch let error {
                    print("json object creation failed: \(error)")
                }
                
                
            } else if let requestErro = error {
                print("data fetching error:\(requestErro)")
            } else {
                print("Unexpected error with the request")
            }
            
        }
        task.resume()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        //open different screens based on identifier set
        switch segue.identifier{
                   case "getallepisodes":
                    let dst = segue.destination as! AllEpisodeTableViewController
                                    dst.episodeList = episodeList
                    
                       
                       
                   case "getepisodesbyseries":
                    let dst = segue.destination as! SeriesEpisodeTableViewController
                                    dst.episodeList = episodeListSeries
        
        case "episodebyid":
         let dst = segue.destination as! EpisodeByIdDetailViewController
                         dst.episodeList = episodeListSeries

                   
                   default:
                       preconditionFailure("seque identifier: \(segue.identifier) was not found")

                   }
        
    }

}

