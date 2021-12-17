//
//  CharacterList.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import Foundation



//this is a death class list  which has list to store its objects
class DeathList{
    var list = [Death]()
    var death: Death!
    
    init(){
    
    }
    
    func removeDeath(index: Int){
           list.remove(at: index)
       }
    
    func moveDeath(from fromIndex: Int, to toIndex: Int){
          let temp = list[fromIndex]
          list.remove(at: fromIndex)
          list.insert(temp, at: toIndex)
      }
}


