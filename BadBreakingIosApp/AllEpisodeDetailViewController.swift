
//
//  CharacterDetailViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit

class AllEpisodeDetailViewController: UIViewController {

    @IBOutlet weak var episode_id: UILabel!
    
    @IBOutlet weak var etitle: UILabel!
    
    
    @IBOutlet weak var season: UILabel!
    
    
   
    @IBOutlet weak var air_date: UILabel!
    
    @IBOutlet weak var characters: UILabel!
    
    
    @IBOutlet weak var epis: UILabel!
    
   
    @IBOutlet weak var series: UILabel!
    
    
    
    var episodeList = EpisodeList()
    var episode: Episode!
   
    var myArray = [Episode]()
    
    var eid:String!
    var tit:String!
    var sea:String!
    var ad:String!
    var chars:String!
    var e:String!
    var ser:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        episode_id.text = "Episode_Id: \(eid!)"
        etitle.text = "Title: \(tit!)"
        season.text = "Season: \(sea!)"
        air_date.text = "Air_Date: \(air_date!)"
        characters.text = "Characters: \(chars!)"
        epis.text = "Episode: \(e!)"
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

