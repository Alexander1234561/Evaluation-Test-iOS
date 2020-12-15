//
//  LoadedDataApi.swift
//  EvalutionTest
//
//  Created by Александр on 15.12.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

//File for parsing Data

import Foundation
import Alamofire

//Static class Singlton for Api
class LoadedData{
    
    // Function of searching with Itunes Api, the arguments -> closure, searching string. This method get information about searhing albums.
    static func loadAlbums(search: String, completion: @escaping([Album]) -> Void) {
        
        // Do request with searching string
        Alamofire.request("https://itunes.apple.com/search?term=\(search)&country=RU&media=music&entity=album&attribute=albumTerm&limit=10&lang=ru_ru").responseData { response in
            
            //decode
            let fullData = try? JSONDecoder().decode(AlbumDecodableStruct.self, from: response.data!)
            guard let fd = fullData else { return }
            guard let res = fd.results else { return }
            
            var albumList: Array<Album> = []
            
            // Creating mass of struct Album
            for album in res {
                let album = Album(name: album.artistName ?? "", artist: album.artistName ?? "", genre: album.primaryGenreName ?? "", image: getImageByURL(url: album.artworkUrl100 ?? ""), collectionId: album.collectionId ?? 0)
                albumList.append(album)
            }
            
            DispatchQueue.main.async { completion(albumList) }
            }
        }
    
    // Function of searching with Itunes Api, the arguments -> closure, searching string. This method get information about album: Track List.
    static func loadSongs(id: Int, completion: @escaping([Song]) -> Void) {
        
        // Do request with Album id
        Alamofire.request("https://itunes.apple.com/lookup?id=\(id)&entity=song").responseData { response in
            //decode
            let fullData = try? JSONDecoder().decode(SongDecodableStruct.self, from: response.data!)
            guard let fd = fullData else { return }
            guard let res = fd.results else { return }
            
            var songList: Array<Song> = []
            
            // Creating mass of struct Song
            for song in res {
                let song = Song(name: song.trackName ?? "", artist: song.artistName ?? "")
                songList.append(song)
            }
            
            DispatchQueue.main.async { completion(songList) }
            
        }
    }
}


// Functions gets the Image vy its URL
func getImageByURL(url: String) -> UIImage? {
    
        guard url != "" else { return nil }
    
        let imageURL = URL(string: url)
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: imageData)
}
