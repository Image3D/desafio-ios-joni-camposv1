//
//  Services.swift
//  desafio-ios-joni-campos
//
//  Created by Joni de Campos on 20/04/20.
//  Copyright © 2020 Joni de Campos. All rights reserved.
//

import Foundation
import UIKit

var oComics: CharacterDataWrapper?
var oExpensive: CharacterComics?

var limit: Int?
var offset: Int?

class Services {
    
    
    
    static func callAPIMarvelCharacters(offset: Int, completion: @escaping (_ result: CharacterDataWrapper ) ->() ){
        
        limit = 20
     // var apiOffset = offset
        
        
        // Marvel API Call
        let jsonUrlString = "https://gateway.marvel.com/v1/public/characters?ts=1&apikey=5ad9e048deff94a55ea68027047f675e&hash=3aea5e30d97860d6ca70af9474173c1f&limit=" + (limit!.description ) + "&offset=" + offset.description


        guard let url = URL(string: jsonUrlString)
            else {return}

        URLSession.shared.dataTask(with: url) { (data, response, err) in

            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }

                // Check if theres data returned
                guard let data = data else{return}


                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                // Parse JSON into Dictionary that contains Characters struct using JSONDecoder
                guard let resultado = try? decoder.decode(CharacterDataWrapper.self, from: data) else {
                    print("Error: Couldn't decode data into dictionary of array of characters")
                    return
                }

                oComics = resultado
                completion(resultado)
                

            }


        }.resume()
    }
    
    
    static func callAPIMarvelCharactersID(completion: @escaping (_ result: CharacterComics ) ->() ){
        // Marvel API Call
        let jsonUrlString = "http://gateway.marvel.com/v1/public/characters/" + String(selectedPersonagemID) + "/comics?ts=1&apikey=5ad9e048deff94a55ea68027047f675e&hash=3aea5e30d97860d6ca70af9474173c1f"


        guard let url = URL(string: jsonUrlString)
            else {return}

        URLSession.shared.dataTask(with: url) { (data, response, err) in

            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }

                // Check if theres data returned
                guard let data = data else{return}


                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                // Parse JSON into Dictionary that contains Characters struct using JSONDecoder
                guard let resultadoID = try? decoder.decode(CharacterComics.self, from: data) else {
                    print("Error: Couldn't decode data into dictionary of array of characters")
                    return
                }

                oExpensive = resultadoID
                completion(resultadoID)
                

            }


        }.resume()
    }
    
}




