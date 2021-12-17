
//
//  CharacterDetailViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit


//view controller to show quote by id  detail data
class QuoteByIdViewController: UIViewController {

  
    @IBOutlet weak var quote_id: UILabel!
    
    
  
  
    @IBOutlet weak var quote_label: UILabel!
    
   
    
    @IBOutlet weak var author: UILabel!
    
   
    @IBOutlet weak var series: UILabel!
    
    
    
    
    var quoteList = QuoteList()
   
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Quote_Id: \(quoteList.list[0].quote_id)")
       quote_id.text = "Quote_Id: \(quoteList.list[0].quote_id)"
        quote_label.text = "Quote: \(quoteList.list[0].quote)"
       author.text = "Author: \(quoteList.list[0].author)"
        series.text = "Series: \(quoteList.list[0].series)"
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





