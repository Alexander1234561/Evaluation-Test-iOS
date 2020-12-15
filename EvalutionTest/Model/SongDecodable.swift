//
//  SongDecodable.swift
//  EvalutionTest
//
//  Created by Александр on 15.12.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

// File with structs for decode data from api
import Foundation

// Contains Array of decodable results, that we need
struct SongDecodableStruct : Codable {
    
    //Number of Array
    let resultCount : Int?
    //Array of Decodable Data
    let results : [Result]?
    
    enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try values.decodeIfPresent([Result].self, forKey: .results)
    }
    
}

struct Result : Codable {
    
    let artistName : String?
    let trackName : String?
    
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case trackName = "trackName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
    }
}
