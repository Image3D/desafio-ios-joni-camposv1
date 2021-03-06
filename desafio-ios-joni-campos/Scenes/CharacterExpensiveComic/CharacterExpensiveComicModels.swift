//
//  CharacterExpensiveComicModels.swift
//  desafio-ios-joni-campos
//
//  Created by Joni de Campos on 15/04/20.
//  Copyright (c) 2020 Joni de Campos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Foundation

enum CharacterExpensiveComic
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
         var resultado: CharacterComics
    }
    struct ViewModel
    {
        var oExpensive: CharacterExpensiveComic.Something.Response
    }
    
  }
}


// MARK: - Comics
struct CharacterComics: Decodable{
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: CharacterComicsDataClass?
}

// MARK: - DataClass
struct CharacterComicsDataClass: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [CharacterComicsResult]?
}

// MARK: - Result
struct CharacterComicsResult: Decodable {
    let id, digitalID: Int?
    let title: String?
    let variantDescription, description: String?
    let resourceURI: String?
    let prices: [Price]?
    let thumbnail: Thumbnail?
    let images: [Thumbnail]?
}

// MARK: - Price
struct Price: Codable {
    let type: String?
    let price: Double?
}
