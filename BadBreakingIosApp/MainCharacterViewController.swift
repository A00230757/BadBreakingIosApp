//
//  MainCharacterViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit

class MainCharacterViewController: UIViewController {

    var characterList = CharacterList()
    var character: Character!
   
    var myArray = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var yourArray = [Character]()
        
        let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
        let fileUrl = URL(string: "https://www.breakingbadapi.com/api/characters")
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
                            //print(jsonArray[0]) // to accesss individual object
                            // print("char_id : ",jsonArray[0]["char_id"]!)
                            // print("name: ",jsonArray[0]["name"]!)
                            // print("birthday : ",jsonArray[0]["birthday"]!)
                            // print("occupation : ",jsonArray[0]["occupation"]!)
                             //print("image path : ",jsonArray[0]["img"]!)
                             //print("status: ",jsonArray[0]["status"]!)
                             //print("appearance : ",jsonArray[0]["appearance"]!)
                             //print("nick name : ",jsonArray[0]["nickname"]!)
                            // print("portrayed : ",jsonArray[0]["portrayed"]!)
                             //print("--------------")
                            // print("        ")
                             yourArray.append( Character(name: single["name"]! as! String,charid: single["name"]! as! String,birthday:single["birthday"]! as! String,occupation: single["name"]! as! String,imagepath: single["img"]! as! String,status: single["status"]! as! String,appearance: single["name"]! as! String,nickname: single["nickname"]! as! String,portrayed: single["portrayed"]! as! String));
                        }
                    } else {
                        print("bad json string")
                    }
                    
                    for s in yourArray{
                        let n: String? = s.name
                        let c: String? = s.charid
                        let b: String? = s.birthday
                        let o: String? = s.occupation
                        let i: String? = s.imagepath
                        let st: String? = s.status
                        let a: String? = s.appearance
                        let nick: String? = s.nickname
                        let p: String? = s.portrayed
                        
                            if n != nil && c != nil && b != nil && o != nil && i != nil && st != nil && a != nil && nick != nil && p != nil{
                            //print(a!)
                                self.characterList.list.append(Character(name: n!, charid: c!, birthday: b!, occupation: o!, imagepath: i!, status: st!, appearance: a!, nickname: nick!, portrayed: p!))
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
        // Do any additional setup after loading the view.
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
        
        
        let dst = segue.destination as! CharacterTableViewController
                        dst.characterList = characterList
        
    }

}
