//
//  MainCharacterViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit


//this is a death  main viewcontroller which fetch data of different endpoints of death and store in lists for show in table view controllers and view controllers of different endpoints.All the different endpoints screens start from buttons present in this view controller.

class MainDeathViewController: UIViewController {

    ///lists to store data
    var allDeathList = DeathList()
    var individualDeathList = DeathList()
    var randomDeathList = DeathList()
    var death: Death!
    
    
    //different endpoint url strings
    var allUrl = "https://www.breakingbadapi.com/api/deaths";
    var individualUrl = "https://www.breakingbadapi.com/api/death?name=Walter+White"
    var randomUrl = "https://www.breakingbadapi.com/api/random-death"
   // var myArray = [Character]()
    
    
    //same method with url and type to fetch data from different endpoints called in view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(url: allUrl,type: "all")
       getData(url: individualUrl, type: "individual")
        getDataRandom(url: randomUrl)
        
       
        // Do any additional setup after loading the view.
    }
    

    
//fetch data and store in lists
    func getData(url: String , type:String){
        var yourArray = [Death]()
        
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
                        
                            let death_id = String(single["death_id"]! as! Int);
                            let season = String(single["season"]! as! Int);
                            let episode = String(single["episode"]! as! Int);
                            let number_of_deaths = String(single["number_of_deaths"]! as! Int);
                            
                            yourArray.append( Death(death_id: death_id ,death: single["death"]! as! String,cause: single["cause"]! as! String,responsible: single["responsible"]! as! String,last_words: single["last_words"]! as! String,season: season ,episode: episode ,number_of_deaths: number_of_deaths ));
                        }
                    } else {
                        print("bad json string")
                    }
                    
                    for s in yourArray{
                        let did: String? = s.death_id
                        let d: String? = s.death
                        let c: String? = s.cause
                        let r: String? = s.responsible
                        let lw: String? = s.last_words
                        let sea: String? = s.season
                        let e: String? = s.episode
                        let nod:String = s.number_of_deaths
                        
                        if did != nil && d != nil && c != nil && r != nil && lw != nil && sea != nil && e != nil && nod != nil{
                            //print(a!)

                                if (type == "all"){
                                    self.allDeathList.list.append(Death(death_id:did!,death:d!,cause:c!,responsible:r!,last_words:lw!,season: sea!,episode: e!,number_of_deaths: nod))
                                }
                            if (type == "individual"){
                                self.individualDeathList.list.append(Death(death_id:did!,death:d!,cause:c!,responsible:r!,last_words:lw!,season: sea!,episode: e!,number_of_deaths: nod))
                            }
                            if (type == "random"){
                                self.randomDeathList.list.append(Death(death_id:did!,death:d!,cause:c!,responsible:r!,last_words:lw!,season: sea!,episode: e!,number_of_deaths: nod))
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
    
    
    //to get random death data
    func getDataRandom(url: String ){
        var yourArray = [Death]()
        
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
                let s1 = "["
                let s2 = "]"
                let string = s1 + String(jsonText) + s2
               
                let data = string.data(using: .utf8)!
                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
                    {
                   
                        print(jsonArray.count)
                        for single in jsonArray{
                        
                            let death_id = String(single["death_id"]! as! Int);
                            let season = String(single["season"]! as! Int);
                            let episode = String(single["episode"]! as! Int);
                            let number_of_deaths = String(single["episode"]! as! Int);
                            
                            yourArray.append( Death(death_id: death_id ,death: single["death"]! as! String,cause: single["cause"]! as! String,responsible: single["responsible"]! as! String,last_words: single["img"]! as! String,season: season ,episode: episode ,number_of_deaths: number_of_deaths ));
                        }
                    } else {
                        print("bad json string")
                    }
                    
                    for s in yourArray{
                        let did: String? = s.death_id
                        let d: String? = s.death
                        let c: String? = s.cause
                        let r: String? = s.responsible
                        let lw: String? = s.last_words
                        let sea: String? = s.season
                        let e: String? = s.episode
                        let nod:String = s.number_of_deaths
                        
                        if did != nil && d != nil && c != nil && r != nil && lw != nil && sea != nil && e != nil && nod != nil{
                            //print(a!)

                              
                                    self.randomDeathList.list.append(Death(death_id:did!,death:d!,cause:c!,responsible:r!,last_words:lw!,season: sea!,episode: e!,number_of_deaths: nod))
                              

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
                   case "alldeathinfo":
                    let dst = segue.destination as! AllDeathInfoTableViewController
                                    dst.allDeathList = allDeathList
                    
                       
                       
                   case "individualdeathinfo":
                    let dst = segue.destination as! IndividualDeathInfoViewController
                    dst.allDeathList = individualDeathList

        case "randomdeathinfo":
         let dst = segue.destination as! RandomDeathInfoViewController
            dst.allDeathList = randomDeathList
                   
                   default:
                       preconditionFailure("seque identifier: \(segue.identifier) was not found")

                   }
        
    }

}



