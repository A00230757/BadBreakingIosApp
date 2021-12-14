//
//  Character.swift
//  BadBreakingIosApp
//
//  Created by Apple on 06/12/21.
//


import Foundation
class Quote: NSObject, NSCoding{
    
    
    var quote_id: String
    var quote:String
    var author:String
    var series:String
    

    init(quote_id: String, quote: String, author: String, series: String){
        
        self.quote_id = quote_id
        self.quote = quote
        self.author = author
        self.series = series
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(quote_id , forKey: "quote_id")
        coder.encode(quote , forKey: "quote")
        coder.encode(author , forKey: "author")
        coder.encode(series , forKey: "series")
    }
    
    required init?(coder: NSCoder) {
        quote_id = coder.decodeObject(forKey: "quote_id") as! String
       quote = coder.decodeObject(forKey: "quote") as! String
        author = coder.decodeObject(forKey: "author") as! String
        series = coder.decodeObject(forKey: "series") as! String
    }
}


