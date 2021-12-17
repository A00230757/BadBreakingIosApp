
//
//  CharacterDetailViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit

class IndividualDeathInfoViewController: UIViewController {

  

    @IBOutlet weak var death_id: UILabel!
    
    
    @IBOutlet weak var death_label: UILabel!
   
    @IBOutlet weak var cause: UILabel!
    
    

    @IBOutlet weak var responsible: UILabel!
    
    
    @IBOutlet weak var last_words: UILabel!
  
    @IBOutlet weak var season: UILabel!
    

    @IBOutlet weak var episode: UILabel!
    
   
    @IBOutlet weak var number_of_deaths: UILabel!
    
    
    var allDeathList = DeathList()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Death_Id: \(allDeathList.list[0].death_id)")
        death_id.text = "Death_Id: \(allDeathList.list[0].death_id)"
        death_label.text = "Death: \(allDeathList.list[0].death)"
        cause.text = "Cause: \(allDeathList.list[0].cause)"
        responsible.text = "Responsible: \(allDeathList.list[0].responsible)"
        last_words.text = "Last_Words: \(allDeathList.list[0].last_words)"
        season.text = "Season: \(allDeathList.list[0].season)"
        episode.text = "Episode: \(allDeathList.list[0].episode)"
        number_of_deaths.text = "Number_Of_Deaths: \(allDeathList.list[0].number_of_deaths)"
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





