//
//  AlbumDecodable.swift
//  EvalutionTest
//
//  Created by Александр on 15.12.2020.
//  Copyright © 2020 Александр. All rights reserved.
//


// File with structs for decode data from api

import Foundation

// Contains Array of decodable results, that we need
struct AlbumDecodableStruct : Codable {
    
    //Number of Array
    let resultCount : Int?
    //Array of Decodable Data
    let results : [Results]?
    
    enum CodingKeys: String, CodingKey {
        
        case resultCount = "resultCount"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }
    
}

struct Results : Codable {
    
    let collectionId : Int?
    let artistName : String?
    let collectionName : String?
    let artworkUrl100 : String?
    let primaryGenreName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case collectionId = "collectionId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case artworkUrl100 = "artworkUrl100"
        case primaryGenreName = "primaryGenreName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
    }
    
}
