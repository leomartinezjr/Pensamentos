//
//  Quote.swift
//  Pensamentos
//
//  Created by Luana Martinez de La Flor on 17/09/21.
//

import Foundation


struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatter: String {
        return "❝💩" + quote + "💩❞"
        
    }
        
    var authorFormatter: String {
        
        return "- " + author + " -"
    }
    

    
    
}
