//
//  ListCharactersModels.swift
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

enum ListCharacters
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        var resultado: CharacterDataWrapper
    }
    struct ViewModel
    {
        var oCharacters: ListCharacters.Something.Response
    }
  }
}
import Foundation
import UIKit



// MARK: - Character
struct CharacterDataWrapper: Decodable{
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data: CharacterDataContainer?
    let etag: String?
    
    
    init(code: Int, status: String, copyright: String, attributionText: String, attributionHTML: String, data: CharacterDataContainer, etag: String){
        
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.data = data
        self.etag = etag
        
    }
    
    
    
}

//MARK: - CharacterDataContainerClass
struct CharacterDataContainer: Decodable{
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let characters: [Character]?
    
    init(offset: Int, limit: Int, total: Int, count: Int, characters: [Character])
    {
        
        self.offset = offset
        self.limit  = limit
        self.total = total
        self.count = count
        self.characters = characters
        
        
    }
    
    
    
    
//    private enum CodingKeys: String, CodingKey {
//        case offset = "offset"
//        case limit = "limit"
//        case total = "total"
//        case count = "count"
//        case characters = "results"
//    }
    

}

//MARK: - Result

struct Character: Decodable{
    let id: Int?
    let name: String?
    let description: String?
    let modified: Date?
    let resourceURI: String?
    let urls: [URLElement]?
    let thumbnail: Thumbnail?
    let comics: Comics?
    let stories: Stories?
    let events: Comics?
    let series: Comics?
    
    init( id: Int, name: String, description: String, modified: Date, resourceURI: String, urls: [URLElement], thumbnail: Thumbnail, comics: Comics, stories: Stories, events: Comics, series: Comics){
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.resourceURI = resourceURI
        self.urls = urls
        self.thumbnail = thumbnail
        self.comics = comics
        self.stories = stories
        self.events = events
        self.series = series
    }
    
    
}



// MARK: - URLElement
struct URLElement: Decodable {
    let type: String?
    let url: String?
}

 enum URLType: String, Decodable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}


// MARK: - Thumbnail
struct Thumbnail: Decodable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Decodable {
    case gif = "gif"
    case jpg = "jpg"
}


// MARK: - Comics
struct Comics: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Decodable {
    let resourceURI: String?
    let name: String?
}


// MARK: - Stories
struct Stories: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Decodable {
    let resourceURI: String?
    let name: String?
    let type: String?
}


