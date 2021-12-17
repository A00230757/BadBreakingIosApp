
//
//  CharacterDetailViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit


//view controller to show character by name detail data
class CharacterByNameViewController: UIViewController {

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var charid: UILabel!

    @IBOutlet weak var birthday: UILabel!

    @IBOutlet weak var occupation: UILabel!
   
    @IBOutlet weak var nickname: UILabel!
    

    @IBOutlet weak var appearance: UILabel!

    @IBOutlet weak var portrayed: UILabel!
  
    @IBOutlet weak var status: UILabel!
    


    @IBOutlet weak var imageView: UIImageView!
    var characterList = CharacterList()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = "CharName: \(characterList.list[0].name)"
        charid.text = "CharId: \(characterList.list[0].charid)"
        birthday.text = "Birthday: \(characterList.list[0].birthday)"
        occupation.text = "Occupation: \(characterList.list[0].occupation)"
        status.text = "Status: \(characterList.list[0].status)"
        appearance.text = "Appearance: \(characterList.list[0].appearance)"
        nickname.text = "Nickname: \(characterList.list[0].nickname)"
        portrayed.text = "Portrayed: \(characterList.list[0].portrayed)"
        
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
        
        let url = URL(string: characterList.list[0].imagepath)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
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


