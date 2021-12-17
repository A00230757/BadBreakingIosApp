//
//  Character.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//


import Foundation
//this is a character class for data members of Character
class Character: NSObject, NSCoding{
    
    
    var name: String
    var charid:String
    var birthday:String
    var occupation:String
    var imagepath:String
    var status:String
    var appearance:String
    var nickname:String
    var portrayed:String
    
    //this is a character class constructor  to intialize data members of Character
    init(name: String, charid: String, birthday: String, occupation: String, imagepath: String, status: String , appearance: String, nickname: String, portrayed: String){
        
        self.name = name
        self.charid = charid
        self.birthday = birthday
        self.occupation = occupation
        self.imagepath = imagepath
        self.status = status
        self.appearance = appearance
        self.nickname = nickname
        self.portrayed = portrayed
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name , forKey: "name")
        coder.encode(charid , forKey: "charid")
        coder.encode(birthday , forKey: "birthday")
        coder.encode(occupation , forKey: "occupation")
        coder.encode(imagepath , forKey: "imagepath")
        coder.encode(status , forKey: "status")
        coder.encode(appearance , forKey: "appearance")
        coder.encode(nickname , forKey: "nickname")
        coder.encode(portrayed , forKey: "portrayed")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        charid = coder.decodeObject(forKey: "charid") as! String
        birthday = coder.decodeObject(forKey: "birthday") as! String
        occupation = coder.decodeObject(forKey: "occupation") as! String
        imagepath = coder.decodeObject(forKey: "imagepath") as! String
        status = coder.decodeObject(forKey: "status") as! String
        appearance = coder.decodeObject(forKey: "appearance") as! String
        nickname = coder.decodeObject(forKey: "nickname") as! String
        portrayed = coder.decodeObject(forKey: "portrayed") as! String
    }
}
