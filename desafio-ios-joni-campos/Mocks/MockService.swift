//
//  MockService.swift
//  desafio-ios-joni-campos
//
//  Created by Joni de Campos on 30/04/20.
//  Copyright © 2020 Joni de Campos. All rights reserved.
//

import Foundation




class MockService:MockProtocols {
    
    
      
      func callAPIMarvelCharactersMock(limit: Int, offset: Int, completion: @escaping (CharacterDataWrapper) -> ()) {
       
         
          
      }
      
}
    
  
    
    
    
    
  func getJSON(fileName: String, success: @escaping(CharacterDataWrapper) -> Void, failure: @escaping(Error) -> ()) {
        

        
       do {

             let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
             let data = try Data(contentsOf: url)
//        print(data)
     let res = try JSONDecoder().decode(CharacterDataWrapper.self, from: data)
        success(res)

        }
        catch {
            print(error)
        }
        
        }
        
  

    
    
    
  
    

