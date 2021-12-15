
//
//  CharacterDetailViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit

class AllQuoteDetailViewController: UIViewController {

  
    @IBOutlet weak var quote_id: UILabel!
    
   
    @IBOutlet weak var quote_label: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var series: UILabel!
    
    
    
    
    var quoteList = QuoteList()
    var quote: Quote!
   
    var myArray = [Quote]()
    
    var qid:String!
    var q:String!
    var auth:String!
    var ser:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Quote_Id: \(qid!)")
       quote_id.text = "Quote_Id: \(qid!)"
        quote_label.text = "Quote: \(q!)"
       author.text = "Author: \(auth!)"
        series.text = "Series: \(ser!)"
        // Do any additional setup after loading the view.
//        fetchRamdomImage { [self]
//                   (remoteUrl) in
//                   self.imgpath = remoteUrl
//            self.fetchImage(remoteUrl: self.imgpath) { (data) in
//                       self.image.image = UIImage(data: data)
//                   }
//               }
        
//        if let filePath = Bundle.main.path(forResource: imgpath, ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
//            imageView.contentMode = .scaleAspectFit
//            imageView.image = image
//        }
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


