//
//  Character.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//


import Foundation
//this is a episode class for data members of Episode
class Episode: NSObject, NSCoding{
    
    
    var episode_id: String
    var title:String
    var season:String
    var air_date:String
    var characters:String
    var episode:String
    var series:String
    
    //this is a episode class constructor  to intialize data members of Episode
    init(episode_id: String, title: String, season: String, air_date: String, characters: String, episode: String , series: String){
        
        self.episode_id = episode_id
        self.title = title
        self.season = season
        self.air_date = air_date
        self.characters = characters
        self.episode = episode
        self.series = series
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(episode_id, forKey: "episode_id")
        coder.encode(title , forKey: "title")
        coder.encode(season , forKey: "season")
        coder.encode(air_date , forKey: "air_date")
        coder.encode(characters , forKey: "characters")
        coder.encode(episode , forKey: "episode")
        coder.encode(series, forKey: "series")
    }
    
    required init?(coder: NSCoder) {
        episode_id = coder.decodeObject(forKey: "episode_id") as! String
        title = coder.decodeObject(forKey: "title") as! String
        season = coder.decodeObject(forKey: "season") as! String
        air_date = coder.decodeObject(forKey: "air_date") as! String
       characters = coder.decodeObject(forKey: "characters") as! String
        episode = coder.decodeObject(forKey: "episode") as! String
        series = coder.decodeObject(forKey: "series") as! String
    }
}

