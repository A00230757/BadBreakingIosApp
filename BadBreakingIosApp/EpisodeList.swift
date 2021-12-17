//
//  CharacterList.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import Foundation



//this is a episode class list  which has list to store its objects
class EpisodeList{
    var list = [Episode]()
    var episode: Episode!
    
    init(){
    
    }
    
    func removeEpisode(index: Int){
           list.remove(at: index)
       }
    
    func moveEpisode(from fromIndex: Int, to toIndex: Int){
          let temp = list[fromIndex]
          list.remove(at: fromIndex)
          list.insert(temp, at: toIndex)
      }
}


