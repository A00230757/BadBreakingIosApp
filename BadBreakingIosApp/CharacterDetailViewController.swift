
//
//  CharacterDetailViewController.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import UIKit

class CharacterDetailViewController: UIViewController {

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
    var character: Character!
   
    var myArray = [Character]()
    
    var n:String!
    var cid:String!
    var b:String!
    var oc:String!
    var st:String!
    var app:String!
    var imgpath:String!
    var nickn:String!
    var port:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = "CharName: \(n!)"
        charid.text = "CharId: \(cid!)"
        birthday.text = "Birthday: \(b!)"
        occupation.text = "Occupation: \(oc!)"
        status.text = "Status: \(st!)"
        appearance.text = "Appearance: \(app!)"
        nickname.text = "Nickname: \(nickn!)"
        portrayed.text = "Portrayed: \(port!)"
        
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
        
        let url = URL(string: imgpath)

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
