//
//  CharacterList.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//

import Foundation



class QuoteList{
    var list = [Quote]()
    var quote: Quote!
    
    init(){
    
    }
    
    func removeQuote(index: Int){
           list.remove(at: index)
       }
    
    func moveQuote(from fromIndex: Int, to toIndex: Int){
          let temp = list[fromIndex]
          list.remove(at: fromIndex)
          list.insert(temp, at: toIndex)
      }
}


