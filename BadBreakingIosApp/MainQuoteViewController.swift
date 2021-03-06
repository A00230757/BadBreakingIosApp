//
//  MainCharacterViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit


//this is a quote main viewcontroller which fetch data of different endpoints of quote and store in lists for show in table view controllers and view controllers of different endpoints.All the different endpoints screens start from buttons present in this view controller.

class MainQuoteViewController: UIViewController {

    ///lists to store data
    var quoteList = QuoteList()
    var quoteListAuthor = QuoteList()
    var quoteByIdList = QuoteList()
    var randomQuoteList = QuoteList()
    var quote: Quote!
    
    
    //different endpoint url strings
    var allUrl = "https://www.breakingbadapi.com/api/quotes";
    var authorUrl = "https://www.breakingbadapi.com/api/quote?author=Jesse+Pinkman"
    var quoteidUrl = "https://www.breakingbadapi.com/api/quotes/1"
    var randomquoteUrl = "https://www.breakingbadapi.com/api/quote/random"
   // var myArray = [Character]()
    
    
    //same method with url and type to fetch data from different endpoints called in view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(url: allUrl,type: "all")
        getData(url: authorUrl, type: "author")
        getData(url: quoteidUrl, type: "id")
        getData(url: randomquoteUrl, type: "random")
       
        // Do any additional setup after loading the view.
    }
    
    //fetch data and store in lists
    func getData(url: String , type:String){
        var yourArray = [Quote]()
        
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
                        
                            let quote_id = String(single["quote_id"]! as! Int);
                            
                            yourArray.append( Quote(quote_id: quote_id ,quote: single["author"]! as! String,author: single["author"]! as! String,series: single["series"]! as! String));
                        }
                    } else {
                        print("bad json string")
                    }
                    
                    for s in yourArray{
                        let qid: String? = s.quote_id
                        let q: String? = s.quote
                        let a: String? = s.author
                        let ser: String? = s.series
                        
                            if qid != nil && q != nil && a != nil && ser != nil{
                            //print(a!)
                                
                                if (type == "all"){
                                    self.quoteList.list.append(Quote(quote_id: qid!,quote:q!,author: a!,series: ser!))
                                }
                                if (type == "author"){
                                    self.quoteListAuthor.list.append(Quote(quote_id: qid!,quote:q!,author: a!,series: ser!))
                                }
                                if (type == "id"){
                                    self.quoteByIdList.list.append(Quote(quote_id: qid!,quote:q!,author: a!,series: ser!))
                                }
                                if (type == "random"){
                                    self.randomQuoteList.list.append(Quote(quote_id: qid!,quote:q!,author: a!,series: ser!))
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
                   case "getallquotes":
                    let dst = segue.destination as! AllQuoteTableViewController
                                    dst.quoteList = quoteList
                    
                       
                       
                   case "getquotebyauthor":
                    let dst = segue.destination as! QuoteByAuthorTableViewController
                                    dst.quoteList = quoteListAuthor
        
        case "getquotebyid":
         let dst = segue.destination as! QuoteByIdViewController
                         dst.quoteList = quoteByIdList

            
        case "getrandomquote":
         let dst = segue.destination as! RandomQuoteViewController
                         dst.quoteList = randomQuoteList

                   
                   default:
                       preconditionFailure("seque identifier: \(segue.identifier) was not found")

                   }
        
    }

}


