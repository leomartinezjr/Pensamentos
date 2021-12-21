//
//  QuotesManage.swift
//  Pensamentos
//
//  Created by Luana Martinez de La Flor on 17/09/21.
//

import Foundation



class QuotesManage {
    
    let quotes:[Quote]
    
    init () {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")! // bundle.main localiza o arquivo no escopo do projeto
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData) // desocompacta o json para o array
        
    }
    
    func getRadomQuotes() -> Quote {
        let index = Int (arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
        
        
    }
    
    
}
