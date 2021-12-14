//
//  Character.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//


import Foundation
class Death: NSObject, NSCoding{
    
    
    var death_id: String
    var death:String
    var cause:String
    var responsible:String
    var season:String
    var episode:String
    var number_of_deaths:String
    

    init(death_id: String, death: String, cause: String, responsible: String, season: String, episode: String , number_of_deaths: String){
        
        self.death_id = death_id
        self.death = death
        self.cause = cause
        self.responsible = responsible
        self.season = season
        self.episode = episode
        self.number_of_deaths = number_of_deaths
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(death_id , forKey: "death_id")
        coder.encode(death , forKey: "death")
        coder.encode(cause, forKey: "cause")
        coder.encode(responsible , forKey: "responsible")
        coder.encode(season , forKey: "season")
        coder.encode(episode, forKey: "episode")
        coder.encode(number_of_deaths , forKey: "number_of_deaths")
    }
    
    required init?(coder: NSCoder) {
        death_id = coder.decodeObject(forKey: "death_id") as! String
        death = coder.decodeObject(forKey: "death") as! String
        cause = coder.decodeObject(forKey: "cause") as! String
        responsible = coder.decodeObject(forKey: "responsible") as! String
        season = coder.decodeObject(forKey: "season") as! String
        episode = coder.decodeObject(forKey: "episode") as! String
        number_of_deaths = coder.decodeObject(forKey: "number_of_deaths") as! String
    }
}


