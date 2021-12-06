//
//  CharacterList.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import Foundation



class CharacterList{
    var list = [Character]()
    var character: Character!
    
    init(){
    
    }
    
    func removeCharacter(index: Int){
           list.remove(at: index)
       }
    
    func moveCharacter(from fromIndex: Int, to toIndex: Int){
          let temp = list[fromIndex]
          list.remove(at: fromIndex)
          list.insert(temp, at: toIndex)
      }
}

